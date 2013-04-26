require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'config/settings'

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Shield::Helpers

Dir["./{lib,models,routes}/**/*.rb"].each  { |rb| require rb }

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie,
  key: "foo",
  secret: SecureRandom.hex(64)

Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: "./public"

Ohm.connect(url: Settings::REDIS_URL)

Cuba.plugin Helpers

Cuba.define do
	persist_session!

  on authenticated(User) do
    run Users
  end

  on default do
  	run Guests
  end
end