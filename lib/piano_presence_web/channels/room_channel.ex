defmodule PianoPresenceWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end


  def handle_in("noteon", %{"note" => note}, socket) do
    broadcast!(socket, "noteon", %{note: note})
    {:noreply, socket}
  end
  def handle_in("noteoff", %{"note" => note}, socket) do
    broadcast!(socket, "noteoff", %{note: note})
    {:noreply, socket}
  end
end
