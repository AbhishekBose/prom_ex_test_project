defmodule PromExTestWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :prom_ex_test_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PromExTestWeb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.2"},
      {:phoenix_ecto, "~> 4.4"},
      {:phoenix_live_view, "~> 0.16.4"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_html, "~> 3.0.4"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.5"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5.1"},
      {:gettext, "~> 0.11"},
      {:prom_ex_test, in_umbrella: true},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:esbuild, "0.3.1", runtime: Mix.env() == :dev},

      # Authentication
      {:ueberauth_google, "~> 0.10"},
      {:joken, "~> 2.4.0"},
      {:joken_jwks, "~> 1.5.0"},

      # File upload
      {:arc, "~> 0.11.0"},
      {:ex_aws, "~> 2.0"},
      {:ex_aws_s3, "~> 2.0"},
      {:poison, "~> 3.0"},
      {:hackney, "~> 1.9"},
      {:sweet_xml, "~> 0.6"},
      {:prom_ex, "~> 1.4.1"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
