 #!/bin/bash
# Run bash <(curl -s https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh)
#     wget -q -O - https://raw.githubusercontent.com/pnagaev/linux/main/setup_basic.sh | bash
#
# Should be run only from root
#


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

# INSTALL SOFTWARE

if [[ "$MyOS" == @(Debian|Astra) ]];then
  printf  "\n\n ${IGreen}Updating system...${NC}\n\n"
  sudo apt -y update && sudo apt -y upgrade
  printf  "\n\n ${IGreen}Installing software...${NC}\n\n"
  sudo apt -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois systemd-timesyncd

fi
if [[ "$MyOS" == @(CentOS|RedHat) ]];then
  printf  "\n\n ${IGreen}Updating system...${NC}"
  sudo yum -y update && sudo yum -y upgrade
  printf  "\n\n ${IGreen}Installing software...${NC}"
  sudo yum -y install vim telnet sudo wget ntpdate ntp mc htop iftop tzdata net-tools git curl man bash-completion dnsutils whois systemd-timesyncd

fi

# COPY CONFIG FILES


export PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;220m\][\[\e[38;5;196m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\H\[\e[38;5;220m\]]\[\e[38;5;118m\]\w\[\e[38;5;196m\]➤\[\e[00m\]"


 printf  "\n\n ${IGreen}Saving old config files...${NC}\n\n"

        mkdir -p old

        mv ".bash_aliases" "old/.bash_aliases.$(date +%H%M%S)"
        mv ".bashrc" "old/.bashrc.$(date +%H%M%S)"
        mv ".inputrc" "old/.inputrc.$(date +%H%M%S)"
        mv ".vimrc" "old/.vimrc.$(date +%H%M%S)"

printf  "\n\n ${IGreen}Copy config files...${NC}\n\n"

        wget https://raw.githubusercontent.com/pnagaev/linux/main/.bash_aliases
        wget https://raw.githubusercontent.com/pnagaev/linux/main/.bashrc
        wget https://raw.githubusercontent.com/pnagaev/linux/main/.inputrc
        wget https://raw.githubusercontent.com/pnagaev/linux/main/.vimrc

#copy colortheme for VIM

mkdir -p .vim/colors
curl -o .vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim


# HOSTNAME

#printf  "\n\n ${IGreen}Setting hostname...${NC}\n\n"
printf  "\n\n ${IYellow}Current hostname is $(hostname) ${NC}\n\n"

#read -p $'\033[0;93mEnter your hostname:\033[0;0m' MyHostName


#if [ -z "$MyHostName" ]
#then
#      echo " Hostname: $MyHostName is wrong"
#else
#      echo " $MyHostName "

#hostnamectl set-hostname $MyHostName

#fi



printf  "\n\n ${IGreen}Setting timezone to Europe/Moscow...${NC}"

timedatectl set-timezone Europe/Moscow
echo 'NTP=0.debian.pool.ntp.org 1.debian.pool.ntp.org 2.debian.pool.ntp.org 3.debian.pool.ntp.org' >> /etc/systemd/timesyncd.conf
timedatectl set-ntp true
systemctl enable --now systemd-timesyncd.service
systemctl restart systemd-timesyncd.service
systemctl status systemd-timesyncd.service
timedatectl status
timedatectl timesync-status

mv -f /etc/motd /etc/motd.old 2>/dev/null
