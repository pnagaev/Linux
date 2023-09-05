#!/bin/bash
##
## New IP login notification script
##
## This script will email the contact specified below whenever
## a user logs into the system from a IP address. The email will contain the
## username, IP address and geolocation info for the login as well as current system
## stats (running processes, other logged in users, network connections, etc).
##
## Installation:
##     - Install GeoIP (ver 1.6+).
##     - Install mutt (ver 1.5+).
##     - Copy and paste this script into /etc/profile.d/notify.sh
##
## Configuration:

function delete_TMP_DIR {
    if [[ -d $TMP_DIR ]]
    then
        rm -rf $TMP_DIR
    fi
}
TMP_DIR=$(mktemp -d -t notify-XXXXXXXXXX)
trap delete_TMP_DIR EXIT

FROM_ADDR="notify@senderdomain.ru"
NOTIFY_ADDR="ivan@recipientdomain.ru"

LOG_USER="$( whoami )"
LOG_DATE="$( date "+%Y-%m-%d %H:%M:%S" )"
OUT_WHO="$( who )"
LOG_IP="$( echo ${SSH_CLIENT} | awk '{ print $1 }' )"

if ! [ -z "$LOG_IP" ]; then
        FULL_GEO_LOC="$( geoiplookup ${LOG_IP} )"
        GEO_LOC="$( geoiplookup ${LOG_IP} | awk -F':' '{ print $2 }' | sed -n 2p | xargs )"
else
        FULL_GEO_LOC="Unknown"
        GEO_LOC="Unknown"
fi

# if this is an interactive shell and we were able to capture an IP address, then proceed
if ! [ -z "$PS1" ] && ! [ -z "$LOG_IP" ]; then

# if this user and IP address combination is not present in our logs
#if ! [[ $(last $LOG_USER -i |grep -v still |grep $LOG_IP) ]]
#then

netstat -ln > $TMP_DIR/netstat-listen.txt
netstat -n > $TMP_DIR/netstat.txt
ps afux > $TMP_DIR/processes.txt
who > $TMP_DIR/who.txt

(
cat <<EOF
------------------------------------------------------------------------
  LOGIN NOTIFICATION
------------------------------------------------------------------------

Host:   $(hostname)
User:   ${LOG_USER}
IP:     ${LOG_IP}
Date:   ${LOG_DATE}
        $(date)
Uptime: $(uptime)

Geo/Host Info:

${FULL_GEO_LOC}

--- Logged in users ----------------------------------------------------
${OUT_WHO}

------------------------------------------------------------------------
Attaching other relevant system data.

EOF
) | /usr/bin/mutt -s "[LOGIN] $(hostname) ${LOG_USER} login from ${LOG_IP} [${GEO_LOC}] " \
  -e "my_hdr From:Alert ROSCHAT <${FROM_ADDR}>" \
  -a $TMP_DIR/netstat-listen.txt -a $TMP_DIR/netstat.txt -a $TMP_DIR/processes.txt -a $TMP_DIR/who.txt \
  -- "${NOTIFY_ADDR}"
fi
delete_TMP_DIR
