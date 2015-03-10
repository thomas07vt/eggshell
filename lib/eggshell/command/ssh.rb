

class SSH < Yolk
	yolk command: "ssh"

	def initialize(argv)
		puts "ARGV: #{argv.inspect}"
	end


end