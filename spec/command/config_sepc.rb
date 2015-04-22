require_relative '../spec_helper'

describe "Config" do

	context '.initialize' do

		it 'parses options' do
			expect_any_instance_of(OptionParser).to receive(:parse!)
			Eggshell::Config.new
		end


		describe 'with no arguments' do

			describe 'with the -g options' do 

				context '.parse_options' do

					it 'sets the @options[:global]' do
						egg = Eggshell::INIT.new(["-g"])
						expect(egg.instance_variable_get(:@options)[:global]).to eq(true)
					end

				end

			end

			describe 'without -g options' do 

			end

		end

		describe 'with an arguments' do

			describe 'with the -g options' do 

			end

			describe 'without -g options' do 

			end

		end


	end

end