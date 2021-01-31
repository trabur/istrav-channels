defmodule DemoWeb.EventsChannel do
  use Phoenix.Channel

  def join("events:lobby", _payload, socket) do
    {:ok, socket}
  end
  # for example "events:12", "events:34"
  def join("events:" <> _private_room_id, _params, socket) do
    {:ok, socket}
  end

  ########
  # events
  ########
  def handle_in("events:broadcast",  %{"room" => room, "message" => message}, socket) do
    broadcast! socket, "room:#{room}", %{message: message}
    {:noreply, socket}
  end
end
