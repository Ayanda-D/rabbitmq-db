defmodule RabbitDB.Message.Properties.Encoded do
  @moduledoc """
    Ecto Schema for RabbitMQ Message Properties Encoded
  """

  use Ecto.Schema

  schema "rabbitmq-message-properties-encoded" do
    field :message_id, :binary
    field :properties_bin, :binary
    field :protocol, :binary
  end

end
