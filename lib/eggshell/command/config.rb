require "optparse"

module Eggshell

  class Config < Yolk
    yolk command: "config"

    def initialize(argv = [])
      @options = {}
      parse_options(argv)
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

  end

end
