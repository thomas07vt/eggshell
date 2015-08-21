require 'eggshell/command'
# Require helpers
Dir["#{File.dirname(__FILE__)}/eggshell/helpers/*.rb"].each { |f| require_relative "#{f}"}

# Require commands
Dir["#{File.dirname(__FILE__)}/eggshell/command/*.rb"].each { |f| require_relative "#{f}"}

require 'eggshell/cli'


module Eggshell

  class << self

    def home
      "#{ENV["HOME"]}/.egg"
    end

    def config
      Eggshell::Config.config.clone
    end

    def styled_error(error)
      puts "#{error.message}"
    end

  end # End class methods

end
