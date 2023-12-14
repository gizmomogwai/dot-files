function ff -d "start firefox with a profile"
  if echo christian.koestlin@gmail.com\nchristian.koestlin@esrlabs.com | fzf > $TMPDIR/fzf.result
    set fzf_result (cat $TMPDIR/fzf.result)
    set h "nohup /Applications/Firefox.app/Contents/MacOS/firefox-bin -P $fzf_result &"
    eval $h
  end
end
