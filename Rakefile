
DATAFILES_DEST = "./data/"
WISDOM = "wisdom.rb"
PREFIX = File.join(ENV['HOME'], 'local')

def command?(command)
  system("type #{command} > /dev/null")
end

def stop_error(message)
    puts "ERROR: #{message}"
    exit(1)
end

def symlink(target, link)
    puts "Linking #{link} => #{target}"
    if File.symlink?(link)
        puts " * deleting existing symlink #{link}"
        File.unlink(link)
    elsif File.exist?(link)
        stop_error("File exists: #{link}")
    end
    File.symlink(target, link)
    puts
end

task :default => :test

@cookies = FileList[File.join(DATAFILES_DEST, '*')].exclude(/(\.dat)$/)

if command? :strfile
    desc "Clean datafiles"
    task :clean do
        FileList[File.join(DATAFILES_DEST, '*.dat')].each do |file|
            puts "removing #{file}"
            File.delete(file) if File.exist?(file)
        end
    end
    desc "Process datafiles"
    task :process => [:clean] do
        @cookies.each do |file|
            puts "converting #{file}.."
            system("strfile #{file} #{file}.dat")
        end
    end
end

if command? :fortune

    desc "Install symlink"
    task :install => [:process] do
        ["/share/wisdom/", "/bin/"].collect{ |d| PREFIX + d }.each do |dir|
            FileUtils.mkdir_p dir unless File.directory?(dir)
        end
        FileUtils.cp_r DATAFILES_DEST, File.join(PREFIX, 'share', 'wisdom/'), :verbose => true
        pwd = File.dirname(__FILE__)
        file = File.basename(WISDOM, File.extname(WISDOM))
        link = "#{PREFIX}/bin/#{file}"
        symlink("#{pwd}/#{WISDOM}", link)
    end

    desc "Test wisdom"
    task :test => [:install] do
        system("wisdom")
    end

    desc "Install symlink"
    task :uninstall do
        ["/share/wisdom/", "/bin/wisdom"].collect{ |d| PREFIX + d }.each do |f|
            FileUtils.rm_rf f
        end
    end
end
