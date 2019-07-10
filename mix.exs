defmodule RabbitDB.MixProject do
  use Mix.Project

  def project do
    [
      app: :rabbitmq_db,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RabbitDB.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:amqp,     "~> 1.2", override: true},
      {:rabbit,   path: "deps/rabbit",   compile: "true", override: true},
      {:jsx, git: "https://github.com/talentdeficit/jsx", tag: "v2.10.0", override: true},
      {:lager,    path: "deps/lager",    compile: "true", override: true},
      {:goldrush, path: "deps/goldrush", compile: "true", override: true}
    ]
  end
end
