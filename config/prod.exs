import Config

# Configures the endpoint
config :hello_world, HelloWorldWeb.Endpoint,
  url: [host: System.get_env("hello-world") <> ".gigalixirapp.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Application.spec(:hello_world, :vsn),
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configures the database
config :hello_world, HelloWorld.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: HelloWorld.Finch

# Disable Swoosh Local Memory Storage
config :swoosh, local: false

# Do not print debug messages in production
config :logger, level: :info

# Configures Phoenix
config :phoenix, :serve_endpoints, true

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
