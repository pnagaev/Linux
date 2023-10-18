#!/bin/bash
# Run bash <(curl -s https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh)
#     wget -q -O - https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh | bash


MyOS=$(cat /etc/os-release | awk -F '=' '/^NAME/{print $2}' | awk '{print $1}' | tr -d '"')

NC='\033[0m' # No Color
# High Intensity
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

printf "OS:${IYellow} $MyOS "

if [[ "$MyOS" == @(Debian|RedHat|Astra) ]];then
  printf  "${IGreen}Updating system..."  
  apt -y update && apt -y upgrade
  printf  "${IGreen}Installing software..."
  apt -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
if [[ "$MyOS" == @(Centos) ]];then
  printf  "${IGreen}Updating system..."
  yum -y update && yum -y upgrade
  printf  "${IGreen}Installing software..."
  yum -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
