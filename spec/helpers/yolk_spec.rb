require_relative '../spec_helper'

describe "Yolk" do

	context '.yolk' do

		it 'invokes .define_eggshell_command with only the command option' do
			expect(Yolk).to receive(:define_eggshell_command).with("rspec")
			Yolk.yolk(command: "rspec", fake: "option")
		end

	end

	context '.define_eggshell_command' do

		it 'sets' do
			Yolk.send(:define_eggshell_command, "rspec")
			expect(Yolk.eggshell_command).to eq("rspec")
		end

	end

	context '.eggshell_command' do
		before do
			Yolk.yolk(command: "rspec")
		end

		it 'returns the eggshell command' do
			expect(Yolk.eggshell_command).to eq("rspec")
		end

	end



end