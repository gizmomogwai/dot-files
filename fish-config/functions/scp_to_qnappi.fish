function scp_to_qnappi -d "scp one thing to qnappi-"
  if find Downloads | fzf > $TMPDIR/fzf.result
    echo sending (cat $TMPDIR/fzf.result) to qnappi _movies
    scp -r (cat $TMPDIR/fzf.result) "qnappi:/Qmultimedia/_movies/"
  end
end
