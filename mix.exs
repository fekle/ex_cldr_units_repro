defmodule ExCldrUnitsRepro.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_cldr_units_repro,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:gettext, "~> 0.26.0"},
      {:ex_cldr, "~> 2.41.0"},
      {:ex_cldr_languages, "~> 0.3.0"},
      {:ex_cldr_numbers, "~> 2.34.0"},
      {:ex_cldr_units, "~> 3.18.0"},
      # fmt
      {:styler, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
