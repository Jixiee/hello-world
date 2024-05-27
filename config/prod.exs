import Config

config :hello_world, HelloWorldWeb.Endpoint,
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Application.spec(:hello_world, :vsn),
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :hello_world, HelloWorld.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: HelloWorld.Finch

config :swoosh, local: false

config :logger, level: :info

config :phoenix, :serve_endpoints, true
