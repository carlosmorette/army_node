defmodule ArmyNodeTest do
  use ExUnit.Case
  doctest ArmyNode

  test "greets the world" do
    assert ArmyNode.hello() == :world
  end
end
