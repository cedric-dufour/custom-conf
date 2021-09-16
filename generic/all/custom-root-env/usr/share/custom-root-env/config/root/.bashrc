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
export PS1="\[\e[35m\]@ \[\e[33m\]\D{%Y-%m-%d %H:%M:%S %z}\[\e[35m\]\n\n* \[\e[01;31m\]\u@$(hostname -f)\[\e[00;35m\]:\[\e[36m\]\w\[\e[35m\]\n#\[\e[0m\] "

# Shell timeout (we're root, after all...)
export TMOUT=900
echo "INFO: Shell timeout is set to ${TMOUT} seconds"
echo "      Use 'unset TMOUT' to clear timeout..."
echo "      But don't forget to logout!"

# X Display
if [ ! "${DISPLAY}" ]; then
  [ ! "${REMOTEHOST}" -o "${REMOTEHOST}" == "${SHORTHOSTNAME}" -o "${REMOTEHOST}" == "${HOSTNAME}" ] &&  export DISPLAY=:0.0 || export DISPLAY=${REMOTEHOST}:0.0
fi

# Environment
export EDITOR=vim

# Terminal size
shopt -s checkwinsize
export COLUMNS LINES

# Shell settings
shopt -s cdspell
shopt -s dirspell
shopt -s extglob

# History settings
shopt -s cmdhist
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=10000

# Aliases
# ... cd
alias cd..='cd ..'
alias cd-='cd -'
# ... ls
alias l1='ls -1'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -la'
# ... rm
alias rm='rm --one-file-system'
# ... ps
alias _psl='ps wwaxf -o user,tty,pid,state,start,time,%cpu,nlwp,ni,pri,%mem,vsz,rsz,command | less -S'
# ... systemctl
alias _sc='systemctl cat'
alias _ss='systemctl status'
alias _sa='systemctl start'
alias _so='systemctl stop'
alias _sr='systemctl restart'
alias _sl='systemctl reload'
alias _sj='journalctl -u'
# ... gcfg
alias _ge='gcfg edit'
alias _gl='gcfg list @FLAGS'
alias _go='gcfg original'
alias _gd='gcfg delta'
# ... misc
alias _dm='dmesg --time-format=iso | tail -n 25'
alias _sy='tail -n 25 /var/log/syslog'

# Coloring
if [ -n "$(which dircolors)" ]; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Helpers
[ -n "$(which lesspipe)" ] && eval "$(SHELL=/bin/sh lesspipe)"

# Completions
[ -r /etc/bash_completion ] && . /etc/bash_completion
# ... systemctl
function _mycomp_systemctl_units {
  local cur=`_get_cword`
  COMPREPLY=( $( systemctl list-units --plain --no-legend --no-pager --all --full --type=target,service,timer,mount,path "${cur}*" | awk '{print $1}' ) )
}
complete -F _mycomp_systemctl_units _sc
complete -F _mycomp_systemctl_units _ss
complete -F _mycomp_systemctl_units _sa
complete -F _mycomp_systemctl_units _so
complete -F _mycomp_systemctl_units _sr
complete -F _mycomp_systemctl_units _sl
complete -F _mycomp_systemctl_units _sj

# Additional settings
[ -r ~/.bashrc_local ] && . ~/.bashrc_local
[ -d ~/.bashrc.d ] && for file in ~/.bashrc.d/*; do [ -r "${file}" ] && source ${file}; done

# Cleanup
unset file

# Switch to home directory
cd

