require_relative '../spec_helper'

describe "Notes" do

  context '.initialize' do

    it 'parses options' do
      expect_any_instance_of(OptionParser).to receive(:parse!)
      Eggshell::Notes.new
    end

    it 'calls the first command passed with opts' do
      expect_any_instance_of(Eggshell::Notes).to \
        receive(:list).with({ global: true }, [])
      expect(Eggshell::Notes.new(["-g", "list"]))
    end

    it 'only calls whitelisted commands' do
      expect_any_instance_of(Eggshell::Notes).to_not receive(:not_allowed)
      expect(Eggshell::Notes.new(["-g", "not_allowed"]))
    end

  end

  context '.parse_options' do

    it 'sets the @options[:global]' do
      egg = Eggshell::Notes.new(["-g"])
      expect(egg.instance_variable_get(:@options)[:global]).to eq(true)
    end

  end

  describe 'with the -g flag' do

    context '#list' do
      #before :all do
      #  system("mkdir -p #{ENV['HOME']}/.eggspec/.egg/notes")
      #  system("touch #{ENV['HOME']}/.eggspec/.egg/notes/rspec.note")
      #end

      it 'prints all *.note files in the golbal folder' do
        expect(Eggshell::Printer).to receive(:log).with("rspec.note")
        Eggshell::Notes.new(["-g", "list"])
      end

    end

    context '#create' do

      before do
        expect(`ls #{ENV['HOME']}/.eggspec/.egg/notes/`).to eq("rspec.note\n")
      end

      after do
        Eggshell::Notes.new(["-g", "delete", "tmp"])
        expect(`ls #{ENV['HOME']}/.eggspec/.egg/notes/`).to eq("rspec.note\n")
      end

      it 'creates a new note with the name passed' do
        Eggshell::Notes.new(["-g", "create", "tmp"])
        expect((`ls #{ENV['HOME']}/.eggspec/.egg/notes/`).include?("tmp.note")).to eq(true)
      end

    end

    context '#delete' do

      before do
        Eggshell::Notes.new(["-g", "create", "del_me"])
        expect(`ls #{ENV['HOME']}/.eggspec/.egg/notes/`).to eq("del_me.note\nrspec.note\n")
      end

      after do
        expect(`ls #{ENV['HOME']}/.eggspec/.egg/notes/`).to eq("rspec.note\n")
      end

      it 'deletes the file named' do
        Eggshell::Notes.new(["-g", "delete", "del_me"])
        expect(`ls #{ENV['HOME']}/.eggspec/.egg/notes/`).to eq("rspec.note\n")
      end

    end

    context '#open' do
      before do
      end



    end

  end



end
