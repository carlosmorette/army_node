defmodule ArmyNode.Message.Handler do
  def process({:print, message}) do
    IO.inspect("PRINT")
    IO.inspect(message)
    :ok
  end

  def process(another_message) do
    IO.inspect("ANOTHER_MESSAGE")
    IO.inspect(another_message)
    :error
  end
end
