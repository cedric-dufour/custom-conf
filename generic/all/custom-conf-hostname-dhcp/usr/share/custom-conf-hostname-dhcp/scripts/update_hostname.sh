#!/bin/bash
## CUSTOM-CONF: File automatically created/updated [custom-conf-hostname-dhcp]

# Hostname (?)
MY_HOSTNAME="${1}"

# Retrieve host name based on its IP address / RDNS pointer
# ... disable previous settings
gcfg.sed 's|^\([^#].*##HOSTNAME##DO-NOT-ERASE-THIS-ANCHOR##\).*$|#\1|' /etc/hosts
# ... retrieve default gateway
MY_DFLTGW="$(ip -6 route | grep '^default')"
[ -z "${MY_DFLTGW}" ] && MY_DFLTGW="$(ip -4 route | grep '^default')"
[ -z "${MY_DFLTGW}" ] && echo 'ERROR: Failed to retrieve the default gateway' >&2 && exit 1
# ... retrieve main (default gateway) interface
MY_DEVICE="$(echo "${MY_DFLTGW}" | fgrep ' dev ' | sed 's|^.* dev \([^ ]*\)\( .*\)*$|\1|')"
[ -z "${MY_DEVICE}" ] && echo 'ERROR: Failed to retrieve the main interface' >&2 && exit 1
# ... retrieve main IP address and hostname
MY_IP4ADDR="$(ip -4 addr show ${MY_DEVICE} | fgrep ' scope global ' | sed 's|^.*inet \([^ /]*\)\(/[^ ]*\)*\( .*\)*$|\1|')"
MY_IP6ADDR="$(ip -6 addr show ${MY_DEVICE} | fgrep ' scope global ' | sed 's|^.*inet6 \([^ /]*\)\(/[^ ]*\)*\( .*\)*$|\1|')"
if [ -z "${MY_HOSTNAME}" ]; then
  [ -n "${MY_IP6ADDR}" ] && MY_HOSTNAME="$(getent hosts ${MY_IP6ADDR} | head -n 1 | awk '{print $2}')"
  if [ -z "${MY_HOSTNAME}" ]; then
    [ -n "${MY_IP4ADDR}" ] && MY_HOSTNAME="$(getent hosts ${MY_IP4ADDR} | head -n 1 | awk '{print $2}')"
  fi
  [ -z "${MY_HOSTNAME}" ] && echo 'ERROR: Failed to retrieve the host name' >&2 && exit 1
fi

# Set hostname
source /usr/share/custom-conf/custom-conf.defs
MY_HOSTNAME_SHORT="${MY_HOSTNAME%%.*}"
MY_HOSTNAME_SUFFIXED="${MY_HOSTNAME%.${CUSTOM_CONF_DOMAIN}}"
MY_HOSTNAME_FULL="${MY_HOSTNAME_SUFFIXED}.${CUSTOM_CONF_DOMAIN}"
echo "INFO: Setting hostname ${MY_HOSTNAME_FULL} (${MY_HOSTNAME_SUFFIXED})"
# ... hostname
cat << EOF > /etc/hostname
${MY_HOSTNAME_SUFFIXED}
EOF
hostname -F /etc/hostname
# ... mailname
cat << EOF > /etc/mailname
${MY_HOSTNAME_FULL}
EOF
# ... hosts
gcfg.sed '/##HOSTNAME##DO-NOT-ERASE-THIS-ANCHOR##/d' /etc/hosts
cat << EOF | tee -a /etc/hosts
${MY_IP4ADDR:-127.0.1.1} ${MY_HOSTNAME_FULL} ${MY_HOSTNAME_SUFFIXED} lanhost  ##HOSTNAME##DO-NOT-ERASE-THIS-ANCHOR##
EOF
cat << EOF | tee -a /etc/hosts
${MY_IP6ADDR:-#IPv6:} ${MY_HOSTNAME_FULL} ${MY_HOSTNAME_SUFFIXED} ip6-lanhost  ##HOSTNAME##DO-NOT-ERASE-THIS-ANCHOR##
EOF

# Run hooks
echo "INFO: Running DHCP-updated hostname hooks"
run-parts ${VERBOSE:+--verbose} /etc/custom-conf/custom-conf-hostname-dhcp/hooks.d

# Done
exit 0

