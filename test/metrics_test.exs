defmodule Metrics.Test do
  use ExUnit.Case, async: true

  test "metrics interface can start without connecting to server" do
    nil = Metrics.Interface.get :foo
    :ok = Metrics.Interface.increment :foo
    1 = Metrics.Interface.get :foo
    
    :ok = Application.start :tcp_listener
    :timer.sleep 100
    1 = length TcpListener.received
    Application.stop :tcp_listener
  end

  test "message is correctly formatted" do
    ["mbp.metric.apples 1 1423619770\n", "mbp.metric.oranges 10 1423619770\n"] = 
      Metrics.Interface.format("mbp", "metric.", %{apples: 1, oranges: 10}, 1423619770)
  end

end
