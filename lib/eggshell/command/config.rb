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

    def show(opts, argv)
      system("vim #{Eggshell.home}/config.yml")
    end

    private

    def handle_command
      command = @commands.shift
      if AVAILABLE_COMMANDS.include?(command)
        self.send(command.to_sym, @options, @commands)
      else
        Printer.print_no_command_error(command, AVAILABLE_COMMANDS)
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


    class << self
      extend Forwardable
      def_delegator :config, :[]

      def load!
        if installed?
          @@config = YAML.load_file("#{Eggshell.home}/config.yml") || {}
          symbolize_keys(@@config)
          @@config
        else
          {}
        end
      end

      def config
        @@config ||= self.load!
      end

      def symbolize_keys(hash)
        hash.keys.each do |key|
          hash[(key.to_sym rescue key) || key] = hash.delete(key)
        end

        hash
      end

    private

      def installed?
        File.exist?("#{Eggshell.home}/config.yml")
      end

    end # End Class methods

  end
end
