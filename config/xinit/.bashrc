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

alias vim='nvim'
alias vi='nvim ./'
alias token='cat /home/$USER/Documents/token | xclip -selection clipboard'
alias ll='ls -o --color=auto'
alias ls='ls --color=auto'

export ROCM_PATH=/opt/rocm
export HIP_PLATFORM=amd
export HIP_PATH=/opt/rocm/hip
export LD_LIBRARY_PATH=/opt/rocm/lib
export LIBRARY_PATH=/opt/rocm/lib
export CPATH=/opt/rocm/include
export PATH=$PATH:/opt/rocm/bin

#PS1=' \u@\h in \W \n -\$ '
PS1='\[\e[35m\]╭─(\u\[\e[96m\]@\[\e[35m\]\h)\[\e[96m\] at\[\e[34m\] \W/\e[35m\]\n╰─\$ \[\e[00m\]'
#neofetch | lolcat
