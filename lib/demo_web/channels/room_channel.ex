defmodule DemoWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _payload, socket) do
    {:ok, socket}
  end
  # for example "room:12", "room:34"
  def join("room:" <> _private_room_id, _params, socket) do
    {:ok, socket}
  end

  ########
  # level
  ########
  def handle_in("level:ping",  %{"room" => room}, socket) do
    IO.puts("PING")

    # finish
    broadcast! socket, "room:#{room}", %{topic: "level:ping", ping: "PONG"}
    {:noreply, socket}
  end
  def handle_in("level:schedule",  %{"room" => room, "id" => id, "tasks" => tasks, "resources" => resources}, socket) do
    # https://bunkat.github.io/schedule/
    broadcast! socket, "room:#{room}", %{topic: "level:cron", id: id, tasks: tasks, resources: resources}

    # finish
    {:noreply, socket}
  end
  def handle_in("level:raft",  %{"room" => room, "id" => id, "packet" => packet}, socket) do
    # raft consensus protocol
    broadcast! socket, "room:#{room}", %{topic: "level:raft", id: id, packet: packet}

    # finish
    {:noreply, socket}
  end

  ########
  # room
  ########
  def handle_in("room:broadcast",  %{"room" => room, "message" => message}, socket) do
    broadcast! socket, "room:#{room}", %{message: message}
    {:noreply, socket}
  end
  def handle_in("room:secure",  %{"vault" => vault, "message" => message}, socket) do
    secret = System.get_env("LOCK")

    # broadcast! socket, , %{key: secret, message: message}
    # is the same as below
    DemoWeb.Endpoint.broadcast "vault:lobby", "vault:broadcast", %{
      key: secret, vault: vault, message: message
    }
    {:noreply, socket}
  end
end
