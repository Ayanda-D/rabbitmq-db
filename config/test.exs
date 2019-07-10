use Mix.Config

config :rabbitmq_db,
  encoded_only: false

config :rabbitmq_db, RabbitDB.Repo,
  database: "rabbitmq_db",
  username: "root",
  password: "rabbitmq",
  hostname: "localhost"
