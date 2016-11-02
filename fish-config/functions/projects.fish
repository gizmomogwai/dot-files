function projects
  if ~/Dropbox/Documents/_projects/projects.rb | fzf > $TMPDIR/project.result
    cd (cat $TMPDIR/project.result)
  end
end
