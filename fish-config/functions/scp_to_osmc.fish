function scp_to_osmc -d "scp one thing to oscm-"
  if find Downloads | fzf > $TMPDIR/fzf.result
    set fzf_result (cat $TMPDIR/fzf.result)
    set h "scp -r \"$fzf_result\" \"osmc@osmc.local:./Movies\"" # ; and rm -rf \"$fzf_result\""
    commandline $h
    commandline -f repaint
  end
end
