require "optparse"

module Eggshell
	module Command
		class << self

			def load!
				Dir["#{File.dirname(__FILE__)}/command/**/*.rb"].each { |f| require f }
			end

			def run(command, args)
				command_object = lookup_command(command)
				puts "COMMAND: #{commands} #{command}"
				puts " STUFF: #{commands[command]}"
				puts "  args: #{args}"
				command_object.new(args)
			end

			def commands
				@@commands ||= {}
			end

			def register_command(command_options)
				command_name = 	command_options[:command]
				commands[command_name] = command_options[:object]
			end

		private

			def lookup_command(command)
				puts "HIT: #{command}"
				return commands[command]
			end

		end # End class methods

	end
end

