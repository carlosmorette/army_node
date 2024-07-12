defmodule ArmyNode.Clients.Mnesia do
  alias ArmyNode.RPC

  def setup(nodes) do
    stop_mnesia_for_many(nodes)
    create_schema(nodes)
    start_for_many(nodes)
  end

  def stop_mnesia_for_many(nodes) do
    Enum.each(nodes, fn n ->
      RPC.stop_mnesia(n)
    end)
  end

  def create_schema(nodes) do
    ArmyNode.Caller.apply(__MODULE__, :mnesia, :create_schema, nodes)
  end

  def start_for_many(nodes) do
    Enum.each(nodes, fn node ->
      RPC.start_mnesia(node)
    end)
  end
end
