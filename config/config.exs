# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :notification_client, NotificationClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RQMLUdz64H+Hfn5UIeq9UFThgHE6By8rF5DZ+b7tzlVbatO9w/xHTDsJZ533n74v",
  render_errors: [view: NotificationClientWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NotificationClient.PubSub,
  live_view: [signing_salt: "3pHyDuiv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
