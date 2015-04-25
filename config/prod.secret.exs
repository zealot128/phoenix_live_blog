use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :live_blog, LiveBlog.Endpoint,
  secret_key_base: "D5MljcxYTJ+O6QmBFZn0xc1Rs3JsYtu0up+WtgoyaXJ1via8dAQjXPadD+ipyLPS"

# Configure your database
config :live_blog, LiveBlog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "live_blog_prod"
