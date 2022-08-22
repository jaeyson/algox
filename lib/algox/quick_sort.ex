defmodule Algox.QuickSort do
  @moduledoc """
  Quick sort: in this version, it picks
  the first element as pivot, then inserts
  the pivoted element in between the
  lesser numbers and greater numbers.

  Accepts integer and returns empty or
  list of integers.
  """

  @doc false
  @spec run(list(integer)) :: [] | list(integer)
  def run(list) do
    do_run(list)
  end

  defp do_run([]), do: []

  @spec do_run(list(integer)) :: list(integer)
  defp do_run([pivot | tail]) do
    {lesser, greater} = Enum.split_with(tail, &(&1 <= pivot))
    do_run(lesser) ++ [pivot] ++ do_run(greater)
  end
end
