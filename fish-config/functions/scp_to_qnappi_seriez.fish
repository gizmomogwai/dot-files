function scp_to_qnappi_seriez -d "scp one thing to qnappi-seriez"
  if find Downloads/torrents | fzf > $TMPDIR/fzf.result
    echo sending (cat $TMPDIR/fzf.result) to qnappi seriez
    scp -r (cat $TMPDIR/fzf.result) "qnappi:/Qmultimedia/_movies/_seriez"
  end
end
