
module Eggshell
  module CLI
    class << self

      def start(*argv)
        # Don't know what these do so I am
        # leaving them here :)
        $stdin.sync = true if $stdin.isatty
        $stdout.sync = true if $stdout.isatty

        command = argv.shift.strip rescue "help"
        validate_install(command)
        Eggshell::Config.load!
        Eggshell::Command.load_all!
        Eggshell::Command.run(command, argv)

      # rescue Errno::EPIPE => e
      #   error(e.message)
      # rescue Interrupt => e
      #   `stty icanon echo`
      #    error("Command cancelled.", false)
      rescue Eggshell::EggException => error
        puts "ERROR: #{error.message}"
        #Eggshell.styled_error(error)
        return
      rescue => error
        puts error
      end

      def validate_install(cmd)
        if !File.directory?(Eggshell.home) && cmd.downcase != 'init'
          raise "Error > Please install Eggshell by running \n\tegg init"
        end
      end

    end # end class methods
  end
end
