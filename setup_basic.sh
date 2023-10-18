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

echo "OS: $MyOS "
printf "I ${IRED}love${NC} Stack Overflow\n"

if [[ "$MyOS" == @(Debian|RedHat|Astra) ]];then
  
  apt -y update && apt -y upgrade
echo "Installing software..."
  apt -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
if [[ "$MyOS" == @(Centos) ]];then
  echo -e "Updating system..."
  yum -y update && yum -y upgrade
  echo -e "Installing software..."
  yum -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
