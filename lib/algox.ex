defmodule Algox do
  alias Algox.{
    BinarySearch,
    LinearSearch,
    QuickSort
  }

  @moduledoc false

  defdelegate binary_search(list, target), to: BinarySearch, as: :run
  defdelegate linear_search(list, target), to: LinearSearch, as: :run
  defdelegate quick_sort(list), to: QuickSort, as: :run
  defdelegate walk_on_matrix(list), to: WalkOnMatrix, as: :run

  @doc """
  Measures execution time spent
  inside the function.

  e.g. Algox.timing("Algox.quick_sort(1..100)")
  """
  @spec timing(String.t()) :: atom
  def timing(function) do
    Mix.Task.run("profile.eprof", ["-e", function])
  end
end
