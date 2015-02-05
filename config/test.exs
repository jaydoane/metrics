use Mix.Config

port = 20037

config :logger, :console,
  level: :warn

config :tcp_listener,
  port: port

config :metrics,
  carbon_host_port: "localhost:" <> Integer.to_string(port),
  interval: 10, # 10 ms
  prefix: "test.metrics."
