defmodule RabbitDB.Types do
  @moduledoc """
    Record types used for processing RabbitMQ/AMQP messages
  """

  require Record

  Record.defrecord :basic_publish, :'basic.publish',
    Record.extract(:'basic.publish',
      from_lib: "rabbit_common/include/rabbit_framing.hrl")

  Record.defrecord :content, :content,
    Record.extract(:content,
      from_lib: "rabbit_common/include/rabbit.hrl")

  Record.defrecord :basic_message, :basic_message,
    Record.extract(:basic_message,
      from_lib: "rabbit_common/include/rabbit.hrl")

  Record.defrecord :p_basic, :'P_basic',
    Record.extract(:'P_basic',
      from_lib: "rabbit_common/include/rabbit_framing.hrl")

end
