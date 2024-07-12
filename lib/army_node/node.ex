defmodule ArmyNode.Node do
  require Logger

  defstruct [:name, :status]

  @type t :: %__MODULE__{}

  def new(name) do
    %__MODULE__{
      name: name,
      status: :unknown
    }
  end

  @spec health_check_many(list(t)) :: list(t)
  def health_check_many(nodes) do
    Enum.map(nodes, &health_check/1)
  end

  def health_check(%__MODULE__{} = node) do
    status = ping(node)
    Logger.info("[#{__MODULE__}] Node: #{node.name} status: #{status}")
    %{node | status: status}
  end

  defp ping(%{name: name}) do
    case Node.ping(name) do
      :pang -> :dead
      :pong -> :alive
    end
  end
end
