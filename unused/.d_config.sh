# This loads DVM into a shell session.
if [[ -s /home/ckoestlin/.dvm/scripts/dvm ]] ; then
  . /home/ckoestlin/.dvm/scripts/dvm
fi

export PATH=~/bin/ldc/bin:$PATH
export LD_LIBRARY_PATH=~/bin/libconfig/lib:$LD_LIBRARY_PATH

export PATH=~/bin/gdc-build/bin:$PATH
        