defmodule ArmyNode.Message.Queue do
  use GenServer
  alias ArmyNode.Message.Handler

  @impl true
  def init(state), do: {:ok, state}

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def handle_info(message, state) do
    new_state =
      case Handler.process(message) do
        :ok -> state
        :error -> [message | state]
      end

    {:noreply, new_state}
  end
end
