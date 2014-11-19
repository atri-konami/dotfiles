files=`ls -A .`.split(" ").delete_if{|str| str =~ /git/}

flag = false
files.each{|fname|
    path = File.expand_path("~") + "/" + fname
    if File.exists?(path) then
        puts "#{path} exists. Please copy the file in other dir and remove that in home dir."
        flag = true
    end
}

if flag then exit(false) end

files.each{|fname|
    path = File.expand_path("~") + "/" + fname
    system("ln -s #{path} #{fname}")
    puts "put a synbolic link for #{path} , derived from dotfiles/#{fname}."
}

puts "dotfile linkage completed. Please confirm it works."
