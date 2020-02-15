# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fast_food_backend,
  ecto_repos: [FastFoodBackend.Repo]

# Configures the endpoint
config :fast_food_backend, FastFoodBackendWeb.Endpoint,
  url: [host: System.get_env("HOST_URL")],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: FastFoodBackendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FastFoodBackendWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  json: Jason


# AWS S3 config
config :ex_aws,
  access_key_id: [System.get_env("AWS_ACCESS_KEY_ID"), :instance_role],
  secret_access_key: [System.get_env("AWS_SECRET_ACCESS_KEY"), :instance_role]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
