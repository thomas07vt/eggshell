require 'eggshell/cli'
require 'eggshell/command'

# Require helpers
Dir["#{File.dirname(__FILE__)}/eggshell/helpers/*.rb"].each { |f| require_relative "#{f}"}
# Require commands
Dir["#{File.dirname(__FILE__)}/eggshell/command/*.rb"].each { |f| require_relative "#{f}"}


module Eggshell

  class << self
    def home
      "#{ENV["HOME"]}/.egg"
    end
  end

end
