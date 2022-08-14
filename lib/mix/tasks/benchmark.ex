defmodule Mix.Tasks.Benchmark do
  use Mix.Task

  @moduledoc false

  @impl Mix.Task
  def run(input) do
    input =
      OptionParser.parse!(input, strict: [])
      |> elem(1)
      |> hd()

    case input in available_functions() do
      true ->
        benchmark(input)

      false ->
        not_found()
    end
  end

  defp not_found do
      """
      You can find available modules to run via
      lib/ directory, then for example run:

      mix run benchmarks/run.exs binary_search
      """
      |> IO.puts()
  end

  defp benchmark(name) do
    impl = implementation(name)
    if not is_nil(impl) do
      [impl, args] = impl
      Benchee.run(impl, benchee_config(args))
    else
      not_found()
    end
  end

  defp available_functions do
    Algox.__info__(:functions)
    |> Enum.map(fn {name, _arity} -> to_string(name) end)

    # :code.all_loaded()
    # |> Enum.filter(fn {mod, _} ->
    #   "#{mod}" =~ ~r/Algox\./ and
    #     mod !== Algo.Behavior and
    #     mod !== Algo.MixProject
    # end)
    # |> Enum.map(fn {mod, _} -> mod end)
  end

  defp implementation(name) do
    %{
      "binary search" => [
        %{
          "Linear search" => fn {list_int, target} ->
            Algox.linear_search(list_int, target)
          end,
          "Binary search" => fn {list_int, target} ->
            Algox.binary_search(list_int, target)
          end,
          "Enum.at/2" => fn {list_int, target} ->
            Enum.find_index(list_int, &(&1 === target))
          end
        },
        fn _ ->
          list = Enum.to_list(1..100_000)
          {list, Enum.random(list)}
        end
      ]
    }[name]
  end

  defp benchee_config(before_each_function) do
    [
      before_each: before_each_function,
      time: 5,
      memory_time: 2,
      warmup: 4
    ]
  end
end
