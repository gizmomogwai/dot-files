if [ "$OSTYPE" = "linux-gnu" ]
then
  if [ -n "$DEBUG" ]
  then
    echo "setting java path"
  fi
  export JAVA_HOME=~/bin/java/current
  export PATH=~/bin/java/current/bin:$PATH
  export PATH=$PATH:~/bin/ant/bin
fi
