function rt -d "select one rake task"
  if rake -T | fzf > /tmp/fzf.result
    set fzf_result (cat /tmp/fzf.result | cut -d ' ' -f 2)
    set h "rake $fzf_result"
    commandline $h
  end
end
