In order to enable resume from hibernate, one must also:

Add the 'resume=' stanza to '/etc/default/grub':

  GRUB_CMDLINE_LINUX_DEFAULT="resume=UUID=<UUID-of-swap-partition>"

(run 'update-grub' to enforce changes)

Add the 'resume=' stanza to '/etc/initramfs-tools/conf.d/resume':

  resume=UUID=<UUID-of-swap-partition>

(run 'update-initramfs -u' to enforce changes)

The UUID of the swap partition can be obtained using:

  blkid <swap-partition>

