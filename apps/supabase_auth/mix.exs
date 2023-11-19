defmodule SupabaseAuth.MixProject do
  use Mix.Project

  def project do
    [
      app: :supabase_auth,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.15",
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
      {:plug, "~> 1.15"},
      {:supabase_potion, umbrella_dep(Mix.env())}
    ]
  end

  defp umbrella_dep(e) when e in [:dev, :test], do: [in_umbrella: true]
  defp umbrella_dep(:prod), do: "~> 0.2"
end