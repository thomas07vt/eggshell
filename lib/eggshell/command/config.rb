require "optparse"
require 'yaml'
require 'forwardable'

module Eggshell
  class Config < Yolk
    yolk command: "config"

    AVAILABLE_COMMANDS = [
      "show",
    ]

    def initialize(argv = [])
      @options = Eggshell::Config.config
      @commands = argv
      parse_options(argv)

      handle_command
    end

    def show
    end

    private

    def handle_command
      command = @commands.shift
      if AVAILABLE_COMMANDS.include?(command)
        self.send(command.to_sym, @options, argv)
      else
        print_no_command_error(command)
      end
    end

    def parse_options(argv)
      parser = OptionParser.new do |op|
        op.on( "-g", "--global",
               "Initialize global .egg folder in home directory") do
          @options[:global] = true
        end
      end
      parser.parse!(argv)
    end

    def print_no_command_error(command)
      Printer.log("Error: #{command} not an available command.\n" +
        "Available commands: #{AVAILABLE_COMMANDS.join(", ")}")
    end

    class << self
      extend Forwardable
      def_delegator :config, :[]

      def load!
        @@config = YAML.load_file("#{Eggshell.home}/config.yml") || {}
        symbolize_keys(@@config)
      end

      def config
        @@config
      end

      def symbolize_keys(hash)
        hash.keys.each do |key|
          hash[(key.to_sym rescue key) || key] = hash.delete(key)
        end

        hash
      end

    end # End Class methods

  end
end
