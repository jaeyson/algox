defmodule Algox do
  alias Algox.BinarySearch
  alias Algox.LinearSearch

  @moduledoc false

  @callback run(term, term) :: term

  defdelegate binary_search(list, target), to: BinarySearch, as: :run
  defdelegate linear_search(list, target), to: LinearSearch, as: :run

  @spec timing(String.t()) :: atom
  def timing(function) do
    Mix.Task.run("profile.eprof", ["-e", function])
  end
end
