set -x PATH ~/bin/repo/esr ~/bin $PATH
set -U EDITOR joe
set -x JAVA_6_HOME ~/bin/java/jdk1.6.0_45
set -x JAVA_8_HOME ~/bin/java/jdk1.8.0_31
set -x PATH $PATH ~/bin/python/3.3.2/bin

. ~/.config/fish/plugins/rvm/rvm.fish
. ~/.config/fish/plugins/rvm/rvm.load
