defmodule RabbitmqDbTest do
  use ExUnit.Case
  doctest RabbitmqDb

  test "greets the world" do
    assert RabbitmqDb.hello() == :world
  end
end
