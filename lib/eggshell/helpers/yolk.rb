

class Yolk
	class << self

		def yolk(options)
			command = options[:command]
			define_eggshell_command(command)
			Eggshell::Command.register_command(command: command, object: self)

		end

		def eggshell_command
			@@command
		end

	private
		def define_eggshell_command(command)
			@@command = command
		end
	end # End self methods
end