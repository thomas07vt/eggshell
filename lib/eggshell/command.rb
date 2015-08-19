require "optparse"

module Eggshell
  module Command
    class << self

      def load_all!
        Dir["#{File.dirname(__FILE__)}/command/**/*.rb"].each { |f| require f }
      end

      def run(command, argv)
        command_object = lookup_command(command)

        # Default is to create a new object with the
        # passed argv.
        # I need to make this more configurable
        command_object.new(argv)
      end

      def commands
        @@commands ||= {}
      end

      def register_command(command_options)
        command_name =   command_options[:command]
        commands[command_name] = command_options[:object]
      end

    private

      def lookup_command(command)
        commands[command]
      end

    end # End class methods

  end
end

