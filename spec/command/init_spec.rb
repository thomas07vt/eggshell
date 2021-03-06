require_relative '../spec_helper'

def rm_dir(name = 'egg')
  egg_dir = "#{Dir.pwd}/#{name}"
  puts "Removing #{egg_dir}"
  system("rm -r #{egg_dir}")
end

def rm_global_dir()
  egg_dir = "#{ENV["HOME"]}/.egg"
  puts "Removing #{egg_dir}"
  system("rm -r #{egg_dir}")
end

describe "INIT" do

  context '.initialize' do

    describe 'with no arguments' do

      it 'creates an egg folder in the global directory' do
        Eggshell::INIT.new
        expect(Dir["#{Eggshell.home}"]).to_not eq([])
        rm_dir
      end

      describe 'with the local (-l) param'do

        it 'creates a .egg folder in the current directory' do
          Eggshell::INIT.new(["-l"])
          expect(Dir["#{Dir.pwd}/.egg"]).to_not eq([])
          rm_dir(".egg")
        end

      end

    end

    describe 'with global argument' do

      it 'creates an egg folder in the users home directory' do
        Eggshell::INIT.new(["--global"])
        expect(Dir["#{Eggshell.home}"]).to_not eq([])
        rm_global_dir
      end

      it 'sets the @options[:global]' do
        egg = Eggshell::INIT.new(["-g"])
        expect(egg.instance_variable_get(:@options)[:global]).to eq(true)
        rm_global_dir
      end

    end

  end

end
