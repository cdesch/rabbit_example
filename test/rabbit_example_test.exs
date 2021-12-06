defmodule RabbitExampleTest do
  use ExUnit.Case
  doctest RabbitExample

  test "greets the world" do
    assert RabbitExample.hello() == :world
  end
end
