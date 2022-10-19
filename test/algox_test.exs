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

  test "Walk on Matrix" do
    four_elems = [
      [11, 12, 13, 14, 15],
      [24, 25, 26, 27, 16],
      [23, 30, 29, 28, 17],
      [22, 21, 20, 19, 18]
    ]

    three_elems = [
      [11, 11, 11, 12, 12],
      [14, 15, 15, 15, 12],
      [14, 14, 13, 13, 13]
    ]

    two_elems = [
      [1, 2, 3, 4, 5],
      [10, 9, 8, 7, 6]
    ]

    one_elem = [[1, 2, 3, 4, 5]]

    sorted_four_elems = Enum.to_list(11..30)
    sorted_three_elems = [11, 11, 11, 12, 12, 12, 13, 13, 13, 14, 14, 14, 15, 15, 15]
    sorted_two_elems = Enum.to_list(1..10)
    sorted_one_elem = Enum.to_list(1..5)

    assert WalkOnMatrix.run(four_elems) === sorted_four_elems
    assert WalkOnMatrix.run(three_elems) === sorted_three_elems
    assert WalkOnMatrix.run(two_elems) === sorted_two_elems
    assert WalkOnMatrix.run(one_elem) === sorted_one_elem
    assert WalkOnMatrix.run([[]]) === []
  end
end
