require 'logger'

module Eggshell
  class Printer

    class << self

      def log(msg)
        puts msg.to_s
      end

      def print_no_command_error(command, available)
        Printer.log("Error: #{command} not an available command.\n" +
          "Available commands: #{available.join(", ")}")
      end

    end # End class methods

  end # End Printer class
end # End Eggshell Modlue
