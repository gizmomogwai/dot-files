SCRIPT_PATH=$(dirname ${BASH_SOURCE:-$0})

#echo $OSTYPE -> linux-gnu or Darwin
#if [ -n "$ZSH_VERSION" ]
#then
#  echo "zsh in use"
#else
#  echo "no zsh in use"
#fi

for f in $SCRIPT_PATH/*-activator.sh
do
  if [ -n "$DEBUG" ]
  then
    echo "Processing $f"
  fi
  source $f
done
unset SCRIPT_PATH