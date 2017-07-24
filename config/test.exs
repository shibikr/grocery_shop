use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :groceryshop, Groceryshop.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :groceryshop, Groceryshop.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "gopinath",
  password: "KARUR@123gopinatj",
  database: "groceryshop_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
