function up -d "lastpass user and password"
  if lpass ls | fzf > /tmp/fzf.result
    cat /tmp/fzf.result
    set account_name (cat /tmp/fzf.result | cut -f 1 -d ' ')
    lpass show --username $account_name | pbcopy
    read -p 'echo username stored in clipboard ... press return to continue'
    lpass show --password $account_name | pbcopy
    read -p 'echo password stored in clipboard ... press return to continue'
  end
end

