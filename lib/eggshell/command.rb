require "optparse"

module Eggshell
	module Command
		class << self

			def load!
				Dir["#{File.dirname(__FILE__)}/command/**/*.rb"].each { |f| require f }
			end

			def run(command, args)
			end

			def commands
				@@commands ||= {}
			end

			def register_command(command_options)
				command_name = 	command_options[:command]
				commands[command_name] = command_options[:object]
			end

		end # End class methods

	end
end

