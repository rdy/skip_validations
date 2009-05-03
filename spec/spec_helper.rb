begin
  require File.expand_path(File.join(File.dirname(__FILE__), '/../../acts_as_fu/lib/acts_as_fu'))
rescue LoadError => e
  puts "These specs require the acts_as_fu plugin"
  exit 0
end
require File.expand_path(File.join(File.dirname(__FILE__), '/../init'))
require 'rubygems'
require 'spec'

Spec::Runner.configure do |config|
  config.include ActsAsFu
end

