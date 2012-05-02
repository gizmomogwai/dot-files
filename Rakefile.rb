D = File.dirname(__FILE__)
H = ENV['HOME']

KeyboardSettings = "#{H}/.gconf/desktop/gnome/peripherals/keyboard/kbd"

directory KeyboardSettings
task :gconf => KeyboardSettings do
  sh "ln -sfv #{D}/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml #{H}/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml"
end

task :inputrc do
  cd ENV['HOME'] do
    sh "ln -sfv #{D}/.inputrc"
  end
end

task :gitconfig do
  cd ENV['HOME'] do
    sh "ln -sfv #{D}/.gitconfig"
  end
end


desc 'links the needed files to $HOME'
task :install => [:inputrc, :gitconfig, :gconf]
