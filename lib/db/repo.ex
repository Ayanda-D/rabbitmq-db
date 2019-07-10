defmodule RabbitDB.Repo do
  @moduledoc false

  use Ecto.Repo, otp_app: :rabbitmq_db,
  adapter: Ecto.Adapters.Postgres
end
