ENV["REDIS_URL"]  ||= "redis://localhost:6379/13"

require_relative '../app'
require 'minitest/spec'
require 'minitest/autorun'
require 'capybara/dsl'
require 'turn'
require 'pry'

Ohm.flush

class AcceptanceTest < MiniTest::Spec
	include Capybara::DSL
end

Capybara.app = Cuba