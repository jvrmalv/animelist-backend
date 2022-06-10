defmodule AnimeList.Repo do
  use Ecto.Repo,
    otp_app: :anime_list,
    adapter: Ecto.Adapters.Postgres
end
