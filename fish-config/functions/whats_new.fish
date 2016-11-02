function whats_new -d "show what new packages are available"
  /usr/lib/update-notifier/apt-check -p
end
