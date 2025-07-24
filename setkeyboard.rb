#!/usr/bin/env ruby
`xinput`.force_encoding('UTF-8').each_line.map do |l|
  l.match(/HID 05f3:0007.*?id=(\d+?)\s.*/)
#    l.match(/Apple Inc. Apple Keyboard.*?id=(\d+?)\s.*/) ||
#    l.match(/.*Ergodox.*id=(\d+?)\s.*/i)
end.compact.each do |i|
  id = i[1]
  command = "xkbcomp -i #{id} -I$HOME/.xkb ~/.xkb/keymap/kinesis $DISPLAY 2> /dev/null"
  command = "xkbcomp -i #{id} -I$HOME/.xkb ~/.xkb/keymap/kinesis $DISPLAY"
  puts "settings keyboard settings for #{i[0]} with #{command}"
  if !system(command)
    puts "Problems with #{command}"
  end
end
