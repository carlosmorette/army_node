defmodule ArmyNode.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ArmyNode.Message.Queue,
      ArmyNode.Nodes
      #ArmyNode.Clients.Mnesia
    ]

    opts = [strategy: :one_for_one, name: ArmyNode.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
