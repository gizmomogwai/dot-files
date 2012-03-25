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
  echo "Processing $f"
  source $f
done
