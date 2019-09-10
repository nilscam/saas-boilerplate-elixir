use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :core, CoreWeb.Endpoint,
  secret_key_base: "1ZoU/kxCBvnVP7/LHgXNozPighnP4TkrZwdV7XNrII5ypu1IM42pJVgjvoD+gHOO"

# Configure your database
config :core, Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "core_prod",
  pool_size: 15
