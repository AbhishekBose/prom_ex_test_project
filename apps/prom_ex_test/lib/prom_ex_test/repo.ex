defmodule PromExTest.Repo do
  use Ecto.Repo,
    otp_app: :prom_ex_test,
    adapter: Ecto.Adapters.Postgres
end
