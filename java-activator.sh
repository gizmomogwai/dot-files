if [ "$OSTYPE" = "linux-gnu" ]
then
  if [ -n "$DEBUG" ]
  then
    echo "setting java path"
  fi 
  export PATH=~/bin/java/jdk1.6.0_30/bin:$PATH
fi
