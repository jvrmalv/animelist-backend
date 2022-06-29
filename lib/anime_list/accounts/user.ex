defmodule AnimeList.Accounts.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :password, :string, redact: true
    has_many :anime, Anime
  end
end
