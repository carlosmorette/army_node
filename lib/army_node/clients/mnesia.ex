defmodule ArmyNode.Clients.Mnesia do
  use GenServer

  alias ArmyNode.RPC

  @impl true
  def init(state), do: {:ok, state}

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def handle_cast({:setup, nodes}, state) do
    setup(nodes)
    {:noreply, state}
  end

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
