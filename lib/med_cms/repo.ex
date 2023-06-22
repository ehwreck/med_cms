defmodule MedCms.Repo do
  use Ecto.Repo,
    otp_app: :med_cms,
    adapter: Ecto.Adapters.Postgres
end
