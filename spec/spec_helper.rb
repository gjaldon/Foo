ENV["REDIS_URL"]  ||= "redis://localhost:6379/13"

require File.expand_path("../app", File.dirname(__FILE__))
require 'minitest/spec'
require 'minitest/autorun'
require 'rack/test'
require 'turn'

Ohm.flush

Turn.config.format = :outline