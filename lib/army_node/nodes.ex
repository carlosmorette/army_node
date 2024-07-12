defmodule ArmyNode.Nodes do
  use GenServer

  @nodes Application.compile_env(:army_node, [__MODULE__, :nodes])

  @impl true
  def init(nodes) do
    schedule_health_check(1)
    {:ok, Enum.map(nodes, &ArmyNode.Node.new/1)}
  end

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, @nodes, name: __MODULE__)
  end

  @impl true
  def handle_info(:health_check, nodes) do
    schedule_health_check(60)
    {:noreply, ArmyNode.Node.health_check_many(nodes)}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  defp schedule_health_check(seconds) do
    Process.send_after(self(), :health_check, :timer.seconds(seconds))
  end
end
