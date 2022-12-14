defmodule Algox.MixProject do
  use Mix.Project

  def project do
    [
      app: :algox,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.11", only: :dev},
      {:stream_data, "~> 0.5", only: [:dev, :test]},
      {:excoveralls, "~> 0.14", only: :test},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false},
      {:benchee, "~> 1.1", only: [:dev, :test]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases do
    [
      test: [
        "format --check-formatted",
        "test --trace",
        "credo --strict --all"
      ]
    ]
  end
end
