defmodule Planilha.Repo do
  use Ecto.Repo,
    otp_app: :planilha,
    adapter: Ecto.Adapters.Postgres
end
