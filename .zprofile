# Set path; this overrides /etc/zshenv
path=(
  #${(@f)$(/bin/cat /etc/paths.d/*)}
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
)

manpath=(
  #${(@f)$(/bin/cat /etc/manpaths.d/*)}
  /usr/local/share/man
  /usr/share/man
)

# vim: filetype=zsh
