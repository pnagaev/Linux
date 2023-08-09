alias ip='ip -4 -c'
alias c='clear;echo -e "\n\n\n"'
alias ping='ping -4 -c 4'
alias ports='netstat -tulanp'
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'



alias ls='ls -h --group-directories-first --color=auto'
alias ll='ls -lah --group-directories-first --color=auto'
alias l.='ls -dh .* --color=auto'
alias cd..='cd ..'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias bc='bc -l'

alias mkdir='mkdir -pv'

alias h='history'
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'


## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'


alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
 
# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'

alias root='sudo -i'
alias su='sudo -i'


alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

alias wget='wget -c'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'
