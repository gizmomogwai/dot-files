if [ "$OSTYPE" = "linux-gnu" ]
then
  if [ -n "$GNOME_KEYRING_PID" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
  fi
fi
