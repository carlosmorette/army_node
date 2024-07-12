defmodule ArmyNode.Caller do
  require Logger

  @spec apply(atom, atom, atom, list) :: any
  def apply(caller, module, fun, args) do
    module
    |> apply(fun, args)
    |> tap(fn res ->
      Logger.info("""
      [#{caller}] #{module}
      fun: #{fun}
      args: #{inspect(args)}

      result: #{inspect(res)}
      """)
    end)
  end
end
