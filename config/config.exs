# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :piano_presence,
  ecto_repos: [PianoPresence.Repo]

# Configures the endpoint
config :piano_presence, PianoPresenceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QUTS0TlFV6fFtqmf+uPxjVaBQCMFUd35B28rEo5L0ReckpIETix45R18LmkqL+wW",
  render_errors: [view: PianoPresenceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PianoPresence.PubSub,
  live_view: [signing_salt: "mNGm4yaJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
