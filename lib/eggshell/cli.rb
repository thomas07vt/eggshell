
module Eggshell
	module CLI
		class << self

			def start(*argv)
				# Don't know what these do so I am 
				# leaving them here :)
				$stdin.sync = true if $stdin.isatty
		    $stdout.sync = true if $stdout.isatty

		    command = argv.shift.strip rescue "help"
		    Eggshell::Command.load!
		    Eggshell::Command.run(command, argv)

		  # rescue Errno::EPIPE => e
		  #   error(e.message)
		  # rescue Interrupt => e
		  #   `stty icanon echo`
		  #    error("Command cancelled.", false)
		  # rescue => error
		  #   styled_error(error)
		  #   exit(1)
		  end

		end # end class methods
	end
end