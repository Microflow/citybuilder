defmodule LiveStory.Mixfile do
  use Mix.Project

  def project do
    [app: :citybuilder,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {LiveStory.Application,  []},
      applications: [
        :logger, :postgrex, :ecto, :timex, :phoenix, :phoenix_html, :phoenix_pubsub,
        :phoenix_ecto, :cowboy, :gettext, :guardian, :comeonin, :recaptcha, :edeliver,
        :arc, :arc_ecto
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0-rc", override: true},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.2"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:arc, "~> 0.8.0"},
     {:arc_ecto, "~> 0.7.0"},
     # from official repository, but not from hex, because latest patches are not released yet
     {:recaptcha, "~> 2.0", github: "samueljseay/recaptcha"},
     {:timex, "~> 3.0"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:guardian, "~> 0.14"},
     {:comeonin, "~> 3.0"},
     {:distillery, "~> 1.0"},
     {:edeliver, "~> 1.4.0"}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
