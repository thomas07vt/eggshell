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

		

	end

end