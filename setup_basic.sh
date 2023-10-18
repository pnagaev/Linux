#!/bin/bash
# Run bash <(curl -s https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh)
#     wget -q -O - https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh | bash

if [ "$(id -u)" -ne 0 ]; then
     #user
     export PS1="\[\e[01;37m\][\[\e[38;5;220m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\H\[\e[01;37m\]]\[\e[38;5;118m\]\w\[\e[38;5;220m\]➤\[\e[m\] "
else
     #admin
     export PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;220m\][\[\e[38;5;196m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\H\[\e[38;5;220m\]]\[\e[38;5;118m\]\w\[\e[38;5;196m\]➤\[\e[00m\]"
fi


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

printf "\n\n OS:${IYellow} $MyOS ${NC} "

if [[ "$MyOS" == @(Debian|RedHat|Astra) ]];then
  printf  "\n\n ${IGreen}Updating system...${NC}"  
  apt -y update && apt -y upgrade
  printf  "\n\n ${IGreen}Installing software...${NC}"
  apt -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
if [[ "$MyOS" == @(Centos) ]];then
  printf  "\n\n ${IGreen}Updating system...${NC}"
  yum -y update && yum -y upgrade
  printf  "\n\n ${IGreen}Installing software...${NC}"
  yum -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois
fi
