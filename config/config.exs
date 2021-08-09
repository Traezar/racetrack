# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :racetrack,
  ecto_repos: [Racetrack.Repo]

# Configures the endpoint
config :racetrack, RacetrackWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GtI7N8+MpMYZk28hckUv18jG9kerkL0NN3ZG1qx6cGJJV7NrsyfAqIlESpiwSCSs",
  render_errors: [view: RacetrackWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Racetrack.PubSub,
  live_view: [signing_salt: "jHPZmKT7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
