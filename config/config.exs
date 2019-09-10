use Mix.Config

config :core,
  ecto_repos: [Core.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :core, CoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b+0JkCGsokOMy/q0U9VJyZoOQJ1wVa0ixPmGxAf9F1pDcksL0pr1uuLLT4dsmMOH",
  render_errors: [view: CoreWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Core.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason




config :money,
  default_currency: :USD


# generate a new secret key for production with `mix guardian.gen.secret` !
config :core,
  Core.Guardian,
  issuer: "core",
  secret_key: "kkL58K5aTduqRvx/6EnsvSwSqI+AjwsnCWaHkg13OxBtmKcGmpU1DEvjSBZJX1sH"



  
import_config "#{Mix.env()}.exs"
