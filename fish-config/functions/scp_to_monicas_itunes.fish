function scp_to_monicas_itunes -d "scp something to monicas itunes"
  if find Downloads/torrents | fzf > $TMPDIR/fzf.result
    scp -r (cat $TMPDIR/fzf.result) "monica@maverick.local:'/Users/monica/Music/iTunes/iTunes Music/Automatically Add to iTunes'"
  end
end
