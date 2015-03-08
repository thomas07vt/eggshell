

class Yolk
	class << self

		def yolk(options)
			command = options[:command]
			define_eggshell_command(command)
		end

		def eggshell_command
			@@command
		end

	private
		def define_eggshell_command(command)
			puts "THERE:: #{command}"
			@@command = command
		end
	end # End self methods
end