defmodule DemoWeb.VaultChannel do
  use Phoenix.Channel

  ########
  # vault
  ########

  def handle_in("vault:broadcast",  %{"key" => key, "vault" => vault, "message" => message}, socket) do
    broadcast! socket, "vault:#{vault}", %{key: key, message: message}
    {:noreply, socket}
  end
  def handle_in("vault:release",  %{"key" => _key, "room" => room, "message" => message}, socket) do
    broadcast! socket, "room:#{room}", %{message: message}
    {:noreply, socket}
  end

  def join("VAULT", _payload, socket) do
    {:ok, socket}
  end
  # for example "vault:***"
  def join("vault:" <> _private_room_id, params, socket) do
    secret = System.get_env("LOCK")
    if secret == params.key do
      {:ok, socket}
    else
      {:noreply, socket}
    end
  end
end
