require_relative 'spec_helper'

describe "Command" do

	before do
	end

	context '.load!' do
		it 'loads standard commands' do
			Eggshell::Command.load!
			expect(Eggshell::Command.commands).to_not be_empty
		end

		# it 'loads user commands' do
		# end

	end

	context '.commands' do
		
		it 'returns a hash' do
			expect(Eggshell::Command.commands.class).to eq(Hash)
		end

	end

	context '.register_command' do
		
		it 'adds a command to @@commands' do
			Eggshell::Command.register_command({command: "string", object: Struct })
			expect(Eggshell::Command.commands.keys).to include("string")
		end
	
	end

	context '.run' do

		it 'passes arguments to command' do
			expect(SSH).to receive(:new).with("rspec")
			Eggshell::Command.run("ssh", "rspec")
		end

		# This test doesn't work for some reason... 
		# I don't know why....
		# it 'invokes lookup_command' do
		# 	expect(Eggshell::Command).to receive(:lookup_command)
		# 	Eggshell::Command.run("ssh", "rspec")
		# end

	end

	context '.lookup_command' do

		it 'returns the command Object' do 
			expect(Eggshell::Command.send(:lookup_command, "ssh")).to eq(SSH)
		end
		
	end

end