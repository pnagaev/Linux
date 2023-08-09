# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#user
export PS1="\[\e[01;37m\][\[\e[38;5;220m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\h\[\e[01;37m\]]\[\e[38;5;118m\]\w\[\e[38;5;220m\]➤\[\e[m\] "

#admin
export PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;220m\][\[\e[38;5;196m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\h\[\e[38;5;220m\]]\[\e[38;5;118m\]\w\[\e[38;5;196m\]➤\[\e[00m\]"  

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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


echo -e "\n"
#cpg.logo - Text from ASCII symbols file
cat cgp.logo | lolcat
echo -e "\n"

#figlet -f pagga.tlf  CommuniGate | lolcat






