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

	context '.run' do
		
	end

end