export SCRIPT_PATH=$(dirname ${BASH_SOURCE:-$0})
echo $SCRIPT_PATH
DEBUG=true

for f in $SCRIPT_PATH/*-activator.sh
do
  if [ -n "$DEBUG" ]
  then
    echo "Processing $f"
  fi
  source $f
done
unset SCRIPT_PATH
