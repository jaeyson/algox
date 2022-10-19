defmodule WalkOnMatrix do
  @moduledoc """
  Walk on matrix: Think of these as "spiral"
  walking until you hit the center of it.
  You start at the very leftmost part, then
  traverse in spiral fashion (or like snake,
  let your imagination flow) until you hit
  the center. We'll use nested list integers
  as an example input.

  Accepts 2-dimensional list of integers
  and returns 1-dimensional list of all
  integers according on the order of
  walking.
  """

  @doc false
  @spec run([[integer()]]) :: [integer()]
  def run([rows]) when length(rows) < 2, do: rows

  def run([first_row | remaining_rows]) do
    first_row = reverse_row(first_row, [])

    remaining_rows
    |> sort([], first_row)
    |> reverse_row([])
  end

  defp sort([], [], sorted_row), do: sorted_row

  defp sort([head | tail], unsorted_rows, sorted_row) when tail === [] do
    [last_elem | rest] = segregate_last_elem(head, [])
    sorted_row = [last_elem | sorted_row]
    sorted_row = add_to_sorted(rest, sorted_row)

    sort(unsorted_rows, [], sorted_row)
  end

  defp sort([head | tail], unsorted_rows, sorted_row) do
    [last_elem | rest] = segregate_last_elem(head, [])
    sorted_row = [last_elem | sorted_row]
    unsorted_rows = [rest | unsorted_rows]

    sort(tail, unsorted_rows, sorted_row)
  end

  defp add_to_sorted([], sorted), do: sorted

  defp add_to_sorted([head | tail], sorted) do
    add_to_sorted(tail, [head | sorted])
  end

  defp reverse_row([], reversed_row), do: reversed_row

  defp reverse_row([head | tail], reversed_row) do
    reverse_row(tail, [head | reversed_row])
  end

  defp segregate_last_elem([head | tail], unsorted_row)
       when tail === [],
       do: [head | unsorted_row]

  defp segregate_last_elem([head | tail], unsorted_row) do
    segregate_last_elem(tail, [head | unsorted_row])
  end
end
