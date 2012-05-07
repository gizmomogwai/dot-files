if [ "$OSTYPE" = "darwin11.0" ]
then
  if [ -n "$DEBUG" ]
  then
    echo "setting homebrew path"
  fi
  export PATH=~/.homebrew/bin:$PATH
fi

