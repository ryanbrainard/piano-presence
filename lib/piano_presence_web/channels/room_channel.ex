defmodule PianoPresenceWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, %{offset: System.os_time(:second)}, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("note" <> _ = event, params, socket) do
    broadcast!(socket, event, params)
    {:noreply, socket}
  end
end
