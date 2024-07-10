defmodule ArmyNode.Message do
  @queue ArmyNode.Message.Queue

  def send_to_node(node, message) when is_atom(node) do
    send({@queue, node}, message)
  end
end
