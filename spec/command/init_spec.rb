require_relative '../spec_helper'

def rm_dir()
	egg_dir = "#{Dir.pwd}/egg"
	puts "Removing #{egg_dir}"
	system("rm -r #{egg_dir}")
end

describe "INIT" do

	context '.initialize' do

		it 'creates a egg folder in the current directory' do
			Eggshell::INIT.new
			expect(Dir["#{Dir.pwd}/egg"]).to_not eq([])
			rm_dir
		end

	end

end