function scp_to_minime -d "move one thing to minime and then remove it"
  if find Downloads | fzf > $TMPDIR/fzf.result
    set fzf_result (cat $TMPDIR/fzf.result)
    set h "scp -r \"$fzf_result\" \"gizmo@minime.local:./Downloads/torrents\"; and rm -rf \"$fzf_result\""
    commandline $h
    commandline -f repaint
  end
end
