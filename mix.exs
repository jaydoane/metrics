defmodule Metrics.Mixfile do
  use Mix.Project

  @description "Collect and periodically send metrics to server"

  defp package do
    [contributors: ["Ricardo Lanziano", "Óscar López", "Maicol Garces"],
     licenses: ["FreeBSD License"],
     links: %{"GitHub" => "https://github.com/tappsi/metrics"}]
  end

  def project do
    [app: :metrics,
     version: "0.0.1",
     elixir: ">= 1.0.1",
     deps: deps,
     package: package,
     description: @description,
     source_url: "https://github.com/tappsi/metrics"]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    dev_apps = Mix.env == :dev && [:reprise] || []
    [applications: dev_apps ++ [:logger],
     mod: {Metrics, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:reprise, "~> 0.3.0", only: :dev},
     {:tcp_listener, github: "jaydoane/tcp-listener"}]
  end
end
