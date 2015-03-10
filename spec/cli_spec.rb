require_relative 'spec_helper'

# def run(args = nil)
# 	system "#{File.dirname(__FILE__)}/../bin/egg #{args}"
# end


describe 'CLI' do
	before do
	end

	it 'loads vendor gems' do
		true # Need to fix this
	end

	context '.start' do

		it 'invokes Eggshell::Command.run' do
			expect(Eggshell::Command).to receive(:run)
			Eggshell::CLI.start
		end

		it 'passes command and args to Command' do
			expect(Eggshell::Command).to receive(:run).with("test", ["-a", "first"])
			Eggshell::CLI.start("test", "-a", "first")
		end

		it 'defaults the command to "help" when nothing is passed' do
			expect(Eggshell::Command).to receive(:run).with("help", [])
			Eggshell::CLI.start
		end

		it 'invokes Eggshell::Command.load!' do
			Eggshell::Command.stub(:run).and_return("test")
			expect(Eggshell::Command).to receive(:load!)
			Eggshell::CLI.start("test", "-a", "first")
		end

	end

end