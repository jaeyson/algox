defmodule AlgoxTest do
  use ExUnit.Case, async: true
  use ExUnitProperties, async: true

  doctest Algox.BinarySearch

  property "Binary Search" do
    check all(target <- integer(1..100_000)) do
      binary_search = fn list, target ->
        Enum.find_index(list, &(&1 === target))
      end

      list =
        1..100_000
        |> Enum.to_list()

      assert Algox.binary_search([1, 2, 3], 4) === nil
      assert Algox.binary_search(list, target) === binary_search.(list, target)
    end
  end

  property "Linear Search" do
    check all(target <- integer(1..100_000)) do
      linear_search = fn list, target ->
        Enum.find_index(list, &(&1 === target))
      end

      list =
        1..100_000
        |> Enum.to_list()

      assert Algox.linear_search([1, 2, 3], 4) === nil
      assert Algox.linear_search(list, target) === linear_search.(list, target)
    end
  end

  test "Quick Sort" do
    list = Enum.shuffle(1..10_000)
    assert Algox.quick_sort(list) === Enum.sort(list)
  end
end
