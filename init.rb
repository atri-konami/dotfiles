# it runs only in Linux.

files=`ls -A .`.split(" ").delete_if{|str| str =~ /git/}

flag = false

tmp_path = File.expand_path("~/dottmp" + Time.now.strftime("_%m%d_%H%M%S"))
system("mkdir #{tmp_path}")

exec_files=[]

files.each{|fname|
    path = File.expand_path("~") + "/" + fname

    if File.exists?(path) then
        print "#{path} exists. Do you move it to #{tmp_path} ? [y/n]:"

        if gets.chomp =~ /[Yy]/ 
            system("cp #{path} #{tmp_path}")
            puts "moved #{path} to #{tmp_path}."
            exec_files << fname
            flag = true
        else
            system("rm -rf #{tmp_path}")
            exit(false)
        end
    end
}

if !flag then
    system("rm -rf #{tmp_path}")
end

exec_files.each{|fname|
    gen_path = File.expand_path("~") + "/" + fname
    der_path = Dir.pwd + "/" + fname

    system("rm #{gen_path}")
    system("ln -s #{der_path} #{gen_path}")
    puts "put a synbolic link for #{path} , derived from dotfiles/#{fname}."
}

puts "dotfile linkage completed. Please confirm it works."
