# spec/spec_helper.rb

ENV['RACK_ENV'] = 'test'
puts " Starting Tests with RACK_ENV=#{ENV['RACK_ENV']}"

require_relative "#{File.dirname(__FILE__)}/../lib/eggshell.rb"

# Override the home for spec tests
module Eggshell

  class << self
    def home
      "#{ENV["HOME"]}/.eggspec/.egg"
    end
  end

end

RSpec.configure do |config|
  # include Rack::Test::Methods

   # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation

end
