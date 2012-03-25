if [ -n "$ZSH_VERSION" ]
then
  if [ -n "$DEBUG" ]
  then
    echo "zsh"
  fi
else
  if [ -n "$DEBUG" ]
  then
    echo "bash"
  fi
  export PS1="\w > "
fi
