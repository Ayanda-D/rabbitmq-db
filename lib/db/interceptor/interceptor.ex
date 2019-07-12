defmodule RabbitDB.Interceptor do

  @behaviour :rabbit_channel_interceptor

  import RabbitDB.Types

  alias RabbitDB.Repo
  alias RabbitDB.Message
  alias Message.Properties, as: MessageProperties
  alias Message.Properties.Encoded, as: MessagePropertiesEncoded

  def init(_ch) do
    :ok
  end

  def description() do
    [description: "Stores published messages in a configure database of choice"]
  end

  def intercept(basic_publish(exchange:    exchange,
                              routing_key: routing_key,
                              mandatory:   mandatory), content, _state) do
    content = :rabbit_binary_parser.ensure_content_decoded(content)
    process_db(exchange, routing_key, mandatory, content)
  end

  def intercept(method, content, _vhost) do
    {method, content}
  end

  def applies_to() do
    [:'basic.publish']
  end

  defp process_db(exchange, routing_key, mandatory,
                  content(class_id:  class_id,
                          properties:
                            p_basic(content_type:     content_type,
                                    content_encoding: content_encoding,
                                    headers:          headers,
                                    delivery_mode:    delivery_mode,
                                    priority:         priority,
                                    correlation_id:   correlation_id,
                                    reply_to:         reply_to,
                                    expiration:       expiration,
                                    message_id:       message_id,
                                    timestamp:        timestamp,
                                    type:             type,
                                    user_id:          user_id,
                                    app_id:           app_id,
                                    cluster_id:       cluster_id),
                          properties_bin:        properties_bin,
                          protocol:              protocol,
                          payload_fragments_rev: pfr)) do
    message = %Message{message_id: message_id,
                       message: to_string(Enum.reverse(pfr)),
                       exchange: exchange,
                       routing_key: routing_key,
                       mandatory: mandatory}
    message_properties = %MessageProperties{message_id: message_id,
                                            class_id:   class_id,
                                            expiry:     expiration,
                                            size: :erlang.iolist_size(pfr),
                                            content_type: content_type,
                                            content_encoding: content_encoding,
                                            headers: :jsx.encode(headers),
                                            delivery_mode: delivery_mode,
                                            priority: priority,
                                            correlation_id: correlation_id,
                                            reply_to: reply_to,
                                            expiration: expiration,
                                            timestamp: timestamp,
                                            type: type,
                                            user_id: user_id,
                                            app_id: app_id,
                                            cluster_id: cluster_id}
    message_properties_encoded =
      %MessagePropertiesEncoded{message_id: message_id,
                                properties_bin: properties_bin,
                                protocol: protocol}
    Enum.map([message, message_properties, message_properties_encoded],
      fn(entry) -> spawn fn -> Repo.insert!(entry) end end)
  end
end
