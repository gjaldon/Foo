ENV["REDIS_URL"]  ||= "redis://localhost:6379/13"

module Shield
  module Model
  end
end

require 'ohm'
require 'minitest/spec'
require 'minitest/autorun'
require 'turn'
Dir["./models/**/*.rb"].each  { |rb| require rb }

Turn.config.format = :dot

Ohm.flush
