
module Eggshell
	
	class INIT < Yolk
		yolk command: "init"

		def initialize(argv = [])
			egg_dir = "#{Dir.pwd}/egg"
			puts "Creating #{egg_dir} directory..."
			system("mkdir #{egg_dir}")
		end
		
	end

end