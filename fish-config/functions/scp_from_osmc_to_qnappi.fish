function scp_from_osmc_to_qnappi -d "scp one movie from osmc to qnappi"
  if ssh osmc@osmc.local ls -1 Movies | fzf > $TMPDIR/fzf.result
    set fzf_result (cat $TMPDIR/fzf.result)
    set h "scp -r \"osmc@osmc.local:../Movies/$fzf_result\" \"qnappi:/Qmultimedia/_movies/\"" #; and rm -rf \"ssh osmc@osmc.local rm Movies/$fzf_result\""
    commandline $h
    commandline -f repaint
  end
end
