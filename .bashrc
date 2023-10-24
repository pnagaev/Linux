# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ "$(id -u)" -ne 0 ]; then
     #user
     export PS1="\[\e[01;37m\][\[\e[38;5;220m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\H\[\e[01;37m\]]\[\e[38;5;118m\]\w\[\e[38;5;220m\]➤\[\e[m\] "
else
     #admin
     export PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;220m\][\[\e[38;5;196m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\H\[\e[38;5;220m\]]\[\e[38;5;11    8m\]\w\[\e[38;5;196m\]➤\[\e[00m\]"
fi


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# date & time for history
HISTTIMEFORMAT='%h %d %H:%M:%S '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


 LS_COLORS="fi=01;37:di=01;35:ex=01;32:ln=37\
 :or=01;30:mi=00:mh=31\
 :pi=33:so=43;30:do=35\
 :bd=35;01:cd=35\
 :su=37;41:sg=30;43:ca=30;41\
 :tw=07;34:ow=30;44:st=30;44"

 export LS_COLORS



echo -e "\n"
#cpg.logo - Text from ASCII symbols file
#cat cgp.logo | lolcat
echo -e "\n"

#figlet -f pagga.tlf  CommuniGate | lolcat

if [ "$(id -u)" -ne 0 ]; then
#Last log users for 3 latest days
last -5
fi




