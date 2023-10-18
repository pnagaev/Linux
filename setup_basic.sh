#!/bin/bash
# Run bash <(curl -s https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh)
#     wget -q -O - https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh | bash


MyOS=$(cat /etc/os-release | awk -F '=' '/^NAME/{print $2}' | awk '{print $1}' | tr -d '"')

echo "OS: $MyOS "

if [[ "$MyOS" == @(Debian|RedHat|Astra) ]];then
  apt -y update && apt -y upgrade
  apt -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
if [[ "$MyOS" == @(Centos) ]];then
  yum -y update && yum -y upgrade
  yum -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
