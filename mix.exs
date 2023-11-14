defmodule HttpStatus.MixProject do
  use Mix.Project

  @source_url "https://github.com/mpotra/ex_http_status"
  @version "0.1.0"

  def project do
    [
      app: :http_status,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "Elixir protocol to convert values into HTTP status codes",
      package: package(),

      # Docs
      name: "HttpStatus",
      docs: docs()
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
      {:credo, "~> 1.7", only: :dev},
      {:dialyxir, "~> 1.4", only: :dev},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "ex_http_status",
      maintainers: ["Mihai Potra"],
      licenses: ["MIT"],
      links: %{
        Changelog: "#{@source_url}/blob/master/CHANGELOG.md",
        GitHub: @source_url
      },
      source_url: @source_url,
      files: ~w(lib mix.exs .formatter.exs README.md CHANGELOG.md LICENSE)
    ]
  end

  defp docs do
    [
      main: "HttpStatus",
      source_ref: "v#{@version}",
      source_url: @source_url,
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"],
      extras: ["CHANGELOG.md"]
    ]
  end
end
