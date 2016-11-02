if [[ "$OSTYPE" == darwin* ]]
then
  if [ -n "$DEBUG" ]
  then
    echo "setting homebrew path"
  fi
  export PATH=~/.homebrew/bin:~/.homebrew/sbin:$PATH
  export XML_CATALOG_FILES=/Users/gizmo/.homebrew/etc/xml/catalog
fi

function createLocalLocateDb() {
  gfind . \! -name "*.o" \! -name "*.elc" \! -wholename "*.git" -print0 | sort -f | $HOME/.homebrew/Cellar/findutils/4.4.2/libexec/gfrcode -0 > $HOME/tmp/locatedb
  }

function myLocate() {
  glocate -d $HOME/tmp/locatedb $@
  }
  