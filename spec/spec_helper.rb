ENV["REDIS_URL"]  ||= "redis://localhost:6379/13"

require_relative '../app'
require 'capybara/dsl'
require 'minitest/spec'
require 'minitest/autorun'
require 'turn'
require 'pry'

Turn.config.format = :dot

Ohm.flush

module MiniTest
  class Spec
    include Capybara::DSL
  end
end

Capybara.app = Cuba