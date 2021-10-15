# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :prom_ex_test,
  ecto_repos: [PromExTest.Repo]

config :prom_ex_test_web,
  ecto_repos: [PromExTest.Repo],
  generators: [context_app: :prom_ex_test]

# Configures the endpoint
config :prom_ex_test_web, PromExTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UGzTD/VRJPGfr1k67jaieLPhcWswUAkAELrqdeEbOz7Kbde7Vs17HGe2/Z3N9qah",
  render_errors: [view: PromExTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PromExTest.PubSub,
  live_view: [signing_salt: "6TVyI7yQ"]

# Configure prom-ex
config :prom_ex_test_web, PromExTestWeb.PromEx,
  grafana: [
    host: "http://localhost:3000",
    # Or authenticate via Basic Auth
    username: "admin",
    password: "admin",
    # This is an optional setting and will default to `true`
    upload_dashboards_on_start: true
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
