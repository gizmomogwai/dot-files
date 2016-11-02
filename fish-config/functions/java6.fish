function java6 -d "use java 6"
  set -g -x JAVA_HOME $JAVA_6_HOME
  echo $JAVA_HOME
  set -g -x PATH $JAVA_HOME/bin $PATH
end
