defmodule Algox.BinarySearch do
  @moduledoc """
  Binary search: marking the middle element
  in a list as pivot (starting point) before
  making any search. Do note the
  implementation needs to sort the list.

  Returns the index position or nil.
  """

  @doc false
  @spec run(list, integer) :: non_neg_integer | nil
  def run(list, target) do
    do_run(list, target, 0, length(list) - 1)
  end

  @spec do_run(list, integer, integer, integer) :: non_neg_integer | nil
  defp do_run(_, _, start, stop) when start > stop, do: nil

  defp do_run(list, target, start, stop) do
    pivot = (start + stop) |> div(2)

    case Enum.at(list, pivot) do
      ^target ->
        pivot

      n when n > target ->
        do_run(list, target, start, pivot - 1)

      n when n < target ->
        do_run(list, target, pivot + 1, stop)
    end
  end
end
