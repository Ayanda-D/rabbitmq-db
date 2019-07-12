defmodule RabbitDB.Message.Properties do
  @moduledoc """
    Ecto Schema for RabbitMQ Message Properties
  """

  use Ecto.Schema

  schema "rabbitmq-message-properties" do
    field :message_id, :binary
    field :class_id, :binary
    field :expiry, :binary
    field :needs_confirming, :boolean
    field :size, :integer

    field :content_type, :binary
    field :content_encoding, :binary
    field :headers, :binary
    field :delivery_mode, :binary
    field :priority, :integer
    field :correlation_id, :binary
    field :reply_to, :binary
    field :expiration, :binary
    field :timestamp, :binary
    field :type, :binary
    field :user_id, :binary
    field :app_id, :binary
    field :cluster_id, :binary
  end
end
