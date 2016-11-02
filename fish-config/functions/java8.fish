function java8 -d "use java 8"
  set -g -x JAVA_HOME $JAVA_8_HOME
  echo $JAVA_HOME
  set -g -x PATH $JAVA_HOME/bin $PATH
end
