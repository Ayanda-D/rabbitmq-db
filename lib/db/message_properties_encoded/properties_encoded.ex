defmodule RabbitDB.Message.Properties.Encoded do
  @moduledoc """
    Database mode for RabbitMQ messages
  """

  use Ecto.Schema

  schema "rabbitmq-message-properties-encoded" do
    field :message_id, :binary
    field :properties_bin, :binary
    field :protocol, :binary
  end

end
