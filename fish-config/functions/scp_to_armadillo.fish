function scp_to_armadillo -d "move one thing to armadillo"
  if find Downloads/torrents | fzf > $TMPDIR/fzf.result
    set fzf_result (cat $TMPDIR/fzf.result)
    set h "scp -r \"$fzf_result\" \"gizmo@armadillo.local:./Downloads/incoming\"; and rm -rf \"$fzf_result\""
    commandline $h
    commandline -f repaint
  end
end
