## CUSTOM-CONF: File automatically created/updated [custom-root-env]


## Default environment

# General settings
umask 022

# Path
# WARNING: do NOT add the '.' in your PATH (security risk)!
export PATH=${HOME}/bin:${PATH}

# Hosts info
export HOSTNAME=$(hostname -f)
export DOMAIN='%{CUSTOM_CONF_DOMAIN}'
export SHORTHOSTNAME=${HOSTNAME%.${DOMAIN}}
export REMOTEHOST=$(who am i | grep '.*(\([^:)]*\).*' | sed 's/.*(\([^:)]*\).*/\1/g')


## Interactive environment
[ ! "${PS1}" ] && return

# Command prompt
export PS1="\[\e[35m\]* \[\e[33m\]\D{%Y-%m-%d %H:%M:%S %z}\[\e[35m\]\n\n* \[\e[31m\]\u@$(hostname -f):\[\e[36m\]\w\[\e[35m\]\n#\[\e[0m\] "

# Shell timeout (we're root, after all...)
export TMOUT=900
echo "INFO: Shell timeout is set to ${TMOUT} seconds"
echo "      Use 'unset TMOUT' to clear timeout..."
echo "      But don't forget to logout!"

# X Display
if [ ! "${DISPLAY}" ]; then
  [ ! "${REMOTEHOST}" -o "${REMOTEHOST}" == "${SHORTHOSTNAME}" -o "${REMOTEHOST}" == "${HOSTNAME}" ] &&  export DISPLAY=:0.0 || export DISPLAY=${REMOTEHOST}:0.0
fi

# Terminal size
shopt -s checkwinsize
export COLUMNS LINES

# Friendly less for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Completion
[ -r /etc/bash_completion ] && . /etc/bash_completion

# History (ignore duplicate lines)
HISTIGNORE='&'

# Coloring
eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Aliases
# ... cd
alias cd..='cd ..'
alias cd-='cd -'
# ... ls
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -la'
# ... rm
alias rm='rm --one-file-system'
# ... apt
alias _au='apt-get update'
_as() { apt-cache search $@ | sort ; }
alias _ap='apt-cache policy'
alias _aw='apt-cache show'
_av() { [ $# -le 0 ] && dpkg -l | sort || dpkg -l | fgrep $1 | sort ; }
alias _ai='apt-get install'
alias _aii='apt-get install --reinstall'
alias _ar='apt-get remove --purge'
alias _aar='apt-get autoremove --purge'
alias _adu='apt-get dist-upgrade'
alias _aduh='apt-get dist-upgrade --ignore-hold'
alias _ac='apt-get clean'
# ... dpkg
alias _dl='dpkg -L'
alias _dp='dpkg -P'
# ... ps
alias _psl='ps waxf -o user,tty,pid,%cpu,%mem,ni,vsz,rss,start,time,state,command | less -S'
# ... icfg
alias _ge='gcfg edit'
alias _gl='gcfg list @FLAGS'
alias _go='gcfg original'
alias _gd='gcfg delta'
# ... misc
alias _dm='dmesg | tail -n 25'

# ... completion
function _mycomp_apt_available_packages {
 local cur
 cur=`_get_cword`
 COMPREPLY=( $( apt-cache pkgnames "$cur" 2>/dev/null ) )
}
complete -F _mycomp_apt_available_packages _aw
complete -F _mycomp_apt_available_packages _ap
complete -F _mycomp_apt_available_packages _ai

function _mycomp_dpkg_installed_packages {
 local cur
 cur=`_get_cword`
 COMPREPLY=( $( dpkg --get-selections | awk '{print $1}' | grep "^$cur" ) )
}
complete -F _mycomp_dpkg_installed_packages _ar
complete -F _mycomp_dpkg_installed_packages _aar
complete -F _mycomp_dpkg_installed_packages _aii
complete -F _mycomp_dpkg_installed_packages _dl
complete -F _mycomp_dpkg_installed_packages _dp

# Environment
export EDITOR=vim

# Additonal local settings
[ -e ~/.bashrc_local ] && source ~/.bashrc_local

# Switch to home directory
cd

