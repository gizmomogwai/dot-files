D = File.dirname(__FILE__)

desc 'links the needed files to $HOME'
task :install do
  cd ENV['HOME'] do
    sh "ln -s #{D}/.inputrc"
  end 
end