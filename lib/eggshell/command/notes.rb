require "optparse"

module Eggshell

  class Notes < Yolk
    yolk command: "notes"

    AVAILABLE_COMMANDS = [
      "list",
      "create",
      "delete"
    ]

    def initialize(argv = [])
      @options = {}
      @commands = argv
      parse_options(argv)
      set_egg_dir
      command = argv.shift
      if AVAILABLE_COMMANDS.include?(command)
        self.send(command.to_sym, @options, argv)
      else
        Printer.log("Error: #{command} not an available command.\n Available commands: #{AVAILABLE_COMMANDS.join(", ")}")
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

    def list(opts, cmds=[])
      notes = Dir["#{@dir}/.egg/notes/*.note"].map { |f| File.basename(f) }
      Printer.log(notes.join("\n"))
    end

    def create(opts, cmds=[])
      if cmds.empty?
        Printer.log("You please provide a name for you note\n e.g:\n $ egg notes create note_name")
      else
        name = cmds[0]
        File.open("#{@dir}/.egg/notes/#{name.to_s}.note", 'w').close
      end
    end

    def delete(opts, cmds=[])
      if cmds.empty?
        Printer.log("You please provide a name for you note\n e.g:\n $ egg notes delete note_name")
      else
        name = cmds[0]
        if File.exists?("#{@dir}/.egg/notes/#{name.to_s}.note")
          File.delete("#{@dir}/.egg/notes/#{name.to_s}.note")
          Printer.log("'#{name.to_s}' deleted.")
        else
          Printer.log("Sorry, I couldn't find '#{name.to_s}.note' in #{Eggshell.home}/notes/")
        end
      end
    end

    private

    def set_egg_dir
      @dir = "."
      @dir = Eggshell.home if @options[:global]
    end



  end

end
