D = File.dirname(__FILE__)
H = ENV['HOME']

apps = ['ScreenlayoutBeam', 'ScreenlayoutWork', 'eclipse_adt', 'eclipse_cdt']
apps.each do |app|
  file_name = File.join(D, '.local', 'share', 'applications', "#{app}.desktop")
  desc "link #{file_name}"
  task app do
    cd H do
      sh "ln -svf #{file_name}"
    end
  end
end

KeyboardSettings = "#{H}/.gconf/desktop/gnome/peripherals/keyboard/kbd"
directory KeyboardSettings
task :gconf => KeyboardSettings do
  sh "ln -sfv #{D}/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml #{H}/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml"
end


dot_files = ['.inputrc', '.gitconfig', '.profile', '.joerc', '.zshrc', '.screenlayout']
dot_files.each do |f|
  file_name = File.join(D, f)
  desc "link #{file_name}"
  task f do
    cd H do
      sh "ln -sfv #{file_name}"
    end
  end
end

desc 'links the needed files to $HOME'
task :install => dot_files + apps + [:gconf]
