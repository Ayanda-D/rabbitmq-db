defmodule RabbitDB.Application do

  def start(_type, _args) do
    children = [
      {RabbitDB.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: RabbitDB.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
