function scp_to_monicas_desktop -d "scp something to monicas desktop"
  if find Downloads | fzf > $TMPDIR/fzf.result
    scp -r (cat $TMPDIR/fzf.result) "monica@maverick.local:'/Users/monica/Desktop'"
  end
end
