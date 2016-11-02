function rm_on_qnappi -d "rm one thing qnappi"
  if ssh qnappi find /Qmultimedia/_movies/ | fzf -m > $TMPDIR/fzf.result
    set fzf_result (cat $TMPDIR/fzf.result)
    set h "ssh qnappi rm -rf $fzf_result"
    commandline $h
    commandline -f repaint
  end
end
