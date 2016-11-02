D = File.dirname(__FILE__)
H = ENV['HOME']

MODE = {}

def debug_prefix
  if MODE[:debug]
    'echo'
  else
    ''
  end
end

def get_os
  if is_mac?
    return "osx"
  else
    return "linux"
  end
end

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
        sh "#{debug_prefix} ln -svf #{file_name}"
      end
    end
  end

  KeyboardSettings = "#{H}/.gconf/desktop/gnome/peripherals/keyboard/kbd"
  directory KeyboardSettings
  task :gconf => KeyboardSettings do
    sh "#{debug_prefix} ln -sfv #{D}/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml #{H}/.gconf/desktop/gnome/peripherals/keyboard/kbd/%gconf.xml"
  end
end

dot_files = [
             '.inputrc',
             '.gitconfig',
             '.profile',
             ".joerc-#{get_os}",
             '.zshrc',
             '.signature-christian.koestlin@gmail.com',
             '.signature-christian.koestlin@esrlabs.com',
             '.msmtprc',
             '.authinfo',
             '.mailcap'
            ]
if is_linux?
  dot_files << '.screenlayout'
end

def remove_os(s)
  file = File.basename(s)
  h = file.index('-')
  if h
    return file[0...h]
  else
    return file
  end
end

dot_files.each do |f|
  file_name = File.join(D, f)
  desc "link #{file_name}"
  task f do
    cd H do
      sh "#{debug_prefix} ln -sfv #{file_name} #{remove_os(file_name)}"
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
all << :emacs_d

task :install => all

desc 'enable debug mode'
task :enable_debug do
  MODE[:debug] = true
end

desc 'link emacs.d config dir'
task :emacs_d do
  cd H do
    sh 'ln -s Dropbox/Documents/_projecst/gizmos_emacs_config_2/.emacs.d'
  end
end


desc 'print what would be done'
task :debug => [:enable_debug, :install]
