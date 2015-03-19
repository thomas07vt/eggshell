
module Eggshell
	
	class INIT < Yolk
		yolk command: "init"

		def initialize(argv = [])
			@options = {}
			parse_options(argv)
			create_global_dir if @options[:global]
			create_local_dir unless @options[:global]
		end

	private

		def parse_options(argv)

			parser = OptionParser.new do |op|

	      op.on( "-g", "--global", 
	             "Initialize global .egg folder in home directory") do
	        @options[:global] = true
	      end

	    end

	    parser.parse!(argv)
	  end



		def create_global_dir
			egg_dir = "#{ENV["HOME"]}/.egg"
			puts "Creating #{egg_dir} directory..."
			system("mkdir #{egg_dir}")
		end

		def create_local_dir
			egg_dir = "#{Dir.pwd}/egg"
			puts "Creating #{egg_dir} directory..."
			system("mkdir #{egg_dir}")
		end
		
	end

end