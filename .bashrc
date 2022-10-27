
#user
export PS1="\[\e[01;37m\][\[\e[38;5;220m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\h\[\e[38;5;118m\]]\w\[\e[01;37m\]]\[\e[38;5;220m\]➤\[\e[m\] "

#admin
export PS1="${debian_chroot:+($debian_chroot)}\[\e[01;37m\][\[\e[38;5;196m\]\u\[\e[38;5;231m\]@\[\e[38;5;27m\]\h\[\e[38;5;118m\]]\w\[\e[38;5;196m\]➤\[\e[00m\]"

alias ip='ip -c'
alias c='clear;echo -e "\n\n\n"'



