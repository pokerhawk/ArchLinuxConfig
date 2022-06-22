#
# ~/.bashrc
#

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


alias ls='ls --color=auto'
#PS1=' \u@\h in \W \n -\$ '
PS1='\[\e[35m\]╭─(\u\[\e[00m\]@\[\e[35m\]\h)\[\e[00m\] at\[\e[34m\] \W/\e[35m\]\n╰─\$\[\e[00m\] '
neofetch | lolcat
