require "optparse"


module Eggshell
	module Command
		class << self

			def load!
				Dir["#{File.dirname(__FILE__)}/command/**/*.rb"].each { |f| require f }
			end

			def run(command, args)
			end

			def commands
				@@commands ||= {}
			end

		end # End class methods

	end
end

[3] pry(main)> class Class
[3] pry(main)*   def first
[3] pry(main)*     puts 'HIT'
[3] pry(main)*   end  
[3] pry(main)* end  
