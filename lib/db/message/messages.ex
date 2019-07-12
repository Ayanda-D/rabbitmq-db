defmodule RabbitDB.Message do
  @moduledoc """
    Ecto Schema for RabbitMQ Message
  """

  use Ecto.Schema

  schema "rabbitmq-message" do
    field :message_id, :binary
    field :message, :binary
    field :exchange, :binary
    field :routing_key, :binary
    field :mandatory, :boolean
  end
end
