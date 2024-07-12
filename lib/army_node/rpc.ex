defmodule ArmyNode.RPC do
  def start_mnesia(node) do
    ArmyNode.Caller.apply(__MODULE__, :rpc, :call, [node, :mnesia, :start, []])
  end

  def stop_mnesia(node) do
    ArmyNode.Caller.apply(__MODULE__, :rpc, :call, [node, :mnesia, :stop, []])
  end
end
