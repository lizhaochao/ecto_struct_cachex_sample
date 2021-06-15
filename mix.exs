defmodule EctoStructCachexSample.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecto_struct_cachex_sample,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      aliases: [test: ["format", "test"]],
      deps: [{:ecto_struct_cachex, "~> 0.2.4"}]
    ]
  end

  def application, do: [extra_applications: [:logger], mod: {EctoStructCachexSample.Application, []}]
end
