require "optparse"
require "pry"

module Eggshell

	class SSH < Yolk
		yolk command: "ssh"

		attr_accessor :options

		def initialize(argv = [])
			@options = {}
			parse_options(argv)
		end

		private

		def parse_options(argv)

			parser = OptionParser.new do |op|

	      op.on( "-a", "--application APPLICATION", 
	             "Explicitly specify the application class to use in the launch") do |app|
	        @options[:application] = app
	      end

	      op.on( "-i", "--ip IP", 
	             "Target ip of ssh session") do |ip|
	        @options[:ip] = ip
	      end

	      op.on( "-u", "--user USER",
	      				"Username to use for ssh session.") do |user|
	      	@options[:user] = user
	      end

	      op.on( "-p", "--pem PEM",
	      				"Full location to pem file used for for ssh session.") do |pem|
	      	@options[:pem] = pem
	      end

	    end

	    parser.parse!(argv)
	  end


	end

end