defmodule PianoPresence.Repo do
  use Ecto.Repo,
    otp_app: :piano_presence,
    adapter: Ecto.Adapters.Postgres
end
