D = File.dirname(__FILE__)

desc 'links the needed files to $HOME'
task :install do
  cd ENV['HOME'] do
    sh "ln -sfv #{D}/.inputrc"
    sh "ln -sfv #{D}/.gitconfig"
    sh "ln -sfv #{D}/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml ~/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml"
  end
end
