D = File.dirname(__FILE__)
H = ENV['HOME']

def is_mac?
  RUBY_PLATFORM.downcase.include?("darwin")
end
def is_linux?
  RUBY_PLATFORM.downcase.include?("linux")
end

if is_linux?
  apps = [
          'ScreenlayoutBeam',
          'ScreenlayoutWork',
          'eclipse_adt',
          'eclipse_cdt'
         ]
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
end

dot_files = [
             '.inputrc',
             '.gitconfig',
             '.profile',
             '.joerc',
             '.zshrc',
             '.signature-christian.koestlin@gmail.com',
             '.signature-christian.koestlin@esrlabs.com',
             '.msmtprc',
             '.authinfo'
            ]
if is_linux?
  dot_files << '.screenlayout'
end

dot_files.each do |f|
  file_name = File.join(D, f)
  desc "link #{file_name}"
  task f do
    cd H do
      sh "ln -sfv #{file_name}"
    end
  end
end

desc 'reminder to adapt /etc/hosts'
task :hosts do
  puts 'please put "173.194.69.109 imap.gmail-alias1.com imap.gmail-alias2.com" into /etc/hosts'
end

desc 'links the needed files to $HOME'
all = dot_files
if is_linux?
  all += apps + [:gconf]
end
all << :hosts
task :install => all
