# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :groceryshop,
  ecto_repos: [Groceryshop.Repo]

# Configures the endpoint
config :groceryshop, Groceryshop.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MVQV4peXVRKdliynkRvshYO6ejhC2QakT9emIQH8Fb1xN+NKpDxG6YSHnY8zk5rn",
  render_errors: [view: Groceryshop.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Groceryshop.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
