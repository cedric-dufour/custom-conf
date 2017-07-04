## CUSTOM-CONF: File automatically created/updated [custom-root-env]

# Clear console
clear
%{CUSTOM_ROOT_ENV_LOGOUT}

# Additional local actions
[ -d ~/.bash_logout.d ] && for file in ~/.bash_logout.d/*; do source ${file}; done

