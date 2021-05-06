defmodule PianoPresenceWeb.PageController do
  use PianoPresenceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
