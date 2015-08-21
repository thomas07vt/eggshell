require "optparse"

module Eggshell

  class INIT < Yolk
    yolk command: "init"

    def initialize(argv = [])
      @options = Eggshell.config
      parse_options(argv)
      create_global_dir_if_needed
      create_local_dir if @options[:local]
    end

  private

    def parse_options(argv)

      parser = OptionParser.new do |op|
        op.on( "-g", "--global",
               "Initialize global .egg folder in home directory") do
          @options[:global] = true
        end

        op.on("-l", "--local",
              "Initialize a local .egg folder in the current directory") do
          @options[:local] = true
        end
      end

      parser.parse!(argv)
    end

    def create_global_dir_if_needed
      if File.directory?(Eggshell.home)
        create_global_dir
      end
    end

    def create_global_dir
      egg_dir = "#{Eggshell.home}"
      puts "Creating #{egg_dir} directory..."
      system("mkdir #{egg_dir}")
    end

    def create_local_dir
      name = ".egg" if @options[:invisible]
      egg_dir = "#{Dir.pwd}/.egg"
      puts "Creating #{egg_dir} directory..."
      system("mkdir #{egg_dir}")
    end

  end

end
