defmodule Apr.EventReceiver do
  alias Apr.KafkaListener

  def start_link(channels) do
    pids = for channel <- channels, do: spawn(KafkaListener, :start, [channel])
    {:ok, List.first(pids)}
  end
end