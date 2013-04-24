require "cuba"
require "mote"
require "cuba/contrib"
require "rack/protection"
require "shield"
require "ohm"
require "securerandom"

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Shield::Helpers

# Require all application files.
Dir["./models/**/*.rb"].each  { |rb| require rb }
Dir["./routes/**/*.rb"].each  { |rb| require rb }

# Require all helper files.
Dir["./lib/**/*.rb"].each { |rb| require rb }

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie,
  key: "foo",
  secret: SecureRandom.hex(64)

Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: "./public"

Cuba.define do
	persist_session!

  on root do
    render("home")
  end

  on default do
  	run Users
  end
end