defmodule RabbitDB.Repo do
  @moduledoc """
    Ecto Repo for the RabbitMQ Database
  """

  use Ecto.Repo, otp_app: :rabbitmq_db,
  adapter: Ecto.Adapters.Postgres
end
