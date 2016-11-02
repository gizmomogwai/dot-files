#export PATH=/home/gizmo/Dropbox/Documents/_projects/neo/linux/bin:$PATH
#export NEO_PWD=/home/gizmo/Dropbox/Documents/_projects/neo/linux/X
#alias asdf='setxkbmap -I$NEO_PWD de neo -print | xkbcomp - -I$NEO_PWD $DISPLAY'

#alias uiae='setxkbmap de'
if [ "$OSTYPE" = "linux-gnu" ]
then
  res=$( lsusb > /dev/null | grep Kinesis )

  if [ $? = "0" ]; then
      echo Kinesis detected.
      echo $SCRIPT_PATH
      p=$SCRIPT_PATH/kinesis.sh
      source $p
  else
      echo No Kinesis detected.
      function uiae {
          setxkbmap de
      }
      function asdf {
          setxkbmap de neo
      }
      asdf
  fi

  res=$( xwacom --list devices > /dev/null | grep "Wacom Bamboo 16FG 6x8 Finger touch" )
  if [ $? = "0" ]; then
      xsetwacom set "Wacom Bamboo 16FG 6x8 Finger touch" mode relative
  fi

fi

