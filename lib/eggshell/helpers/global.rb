

# class Class
# 	def eggshell(options={})
# 		puts "eggshell first"
# 		extend Eggshell::Global
# 		include Eggshell::Global
# 		puts "OPTIONS : #{options}"
# 		Eggshell::Global.init(options)
# 	end  
# end  

# module Eggshell
# 	module Global

# 		def self.init(options)
# 			puts "init"
# 			self.eggshell_command = options[:command]
# 		end

# 		def self.eggshell_command
# 			puts "egg_command"
# 			@eggshell_command
# 		end

# 		def self.eggshell_command=(command)
# 			puts "set egg_command"
# 			@eggshell_command = command
# 		end
# 	end
# end

# class SSH
# 	eggshell command: "ssh"

# 	def initialize
# 		puts "hII"
# 	end
# end