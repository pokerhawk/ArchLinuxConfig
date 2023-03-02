#
# ~/.bashrc
#

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#\d	current date
#\e	escape character
#\h	the hostname
#\n	a newline
#\t	current time 24-hour hh:mm:ss
#\T	current time 12-hour hh:mm:ss
#\@	current time 12-hour hh:mm:ss am/pm
#\u	username of current user
#\w	path to current working directory

alias hd='cd /run/media/HDD/'
alias home='cd ~'
alias vim='nvim'
alias vi='nvim'
alias ll='ls -o --color=auto'
alias ls='ls --color=auto'

#PS1=' \u@\h in \W \n -\$ '
PS1='\[\e[35m\]╭─(\u\[\e[96m\]@\[\e[35m\]\h)\[\e[96m\] at\[\e[34m\] \W/\e[35m\]\n╰─\$ \[\e[00m\]'
#neofetch | lolcat
