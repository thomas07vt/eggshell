# spec/spec_helper.rb
# unless ["production", "stage", "development" ].include?(ENV['RACK_ENV']) 
#   ENV['RACK_ENV'] = 'test'
# end

ENV['RACK_ENV'] = 'test'
puts " Starting Tests with RACK_ENV=#{ENV['RACK_ENV']}"

Dir["#{File.dirname(__FILE__)}/../lib/eggshell.rb"].each { |f| require_relative "#{f}" }

RSpec.configure do |config|
  # include Rack::Test::Methods

   # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation 

end
