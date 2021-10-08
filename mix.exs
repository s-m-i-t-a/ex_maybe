defmodule ExMaybe.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_maybe,
      description:
        "This library fills a bunch of important niches. A Maybe can help you with optional arguments, error handling, and records with optional fields.",
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        plt_add_apps: [:mix],
        ignore_warnings: "dialyzer.ignore-warnings",
        flags: [
          :unmatched_returns,
          :error_handling,
          :race_conditions,
          :no_opaque
        ]
      ],
      version: "1.1.1",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.20", only: :dev},
      {:excoveralls, "~> 0.11", only: :test},
      {:credo, "~> 1.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.1.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: [
        "Jindrich K. Smitka <smitka.j@gmail.com>"
      ],
      licenses: ["BSD"],
      links: %{
        "GitHub" => "https://github.com/s-m-i-t-a/ex_maybe"
      }
    ]
  end
end
