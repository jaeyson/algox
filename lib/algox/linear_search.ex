defmodule Algox.LinearSearch do
  @behaviour Algox

  @moduledoc """
  Linear search: needs to traverse the
  entire list in order to find the target.

  Returns the index position or nil.
  """

  @doc false
  @impl Algox
  @spec run(list, integer) :: non_neg_integer | nil
  def run(list, target) do
    do_run(list, target, 0)
  end

  @spec do_run(list, integer, integer) :: non_neg_integer | nil
  defp do_run([], _target, _stop), do: nil

  defp do_run([h | t], target, stop) do
    case h === target do
      true ->
        stop

      false ->
        do_run(t, target, stop + 1)
    end
  end
end
