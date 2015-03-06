# Require self files
eggshell_path = File.dirname(__FILE__)

# Require files
Dir["#{eggshell_path}/**/*.rb"].each { |f| require_relative "#{f}"}
