require_relative '../spec_helper'

describe "SSH" do

	context '.initialize' do

		it 'parses options' do
			expect_any_instance_of(OptionParser).to receive(:parse!)
			Eggshell::SSH.new
		end

	end

	context '.parse_options' do

		it 'set the @options variable' do
			ssh = Eggshell::SSH.new(["-a", "test_app"])
			expect(ssh.options).to_not eq({})
		end

		it 'sets @options[:application] if -a is passed' do
			ssh = Eggshell::SSH.new(["-a", "test_app"])
			expect(ssh.options[:application]).to eq("test_app")
		end

		it 'sets @options[:ip] if -i is passed' do
			ssh = Eggshell::SSH.new(["-i", "10.0.0.1"])
			expect(ssh.options[:ip]).to eq("10.0.0.1")
		end

		it 'sets @options[:user] if -u is passed' do
			ssh = Eggshell::SSH.new(["-u", "ec2-user"])
			expect(ssh.options[:user]).to eq("ec2-user")
		end

		it 'sets @options[:pem] if -p is passed' do
			ssh = Eggshell::SSH.new(["-p", "/path/pem.pem"])
			expect(ssh.options[:pem]).to eq("/path/pem.pem")
		end

	end

end
