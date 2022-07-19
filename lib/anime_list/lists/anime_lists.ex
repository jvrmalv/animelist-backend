defmodule AnimeList.Lists.AnimeListEntry do
  @moduledoc """
  AnimeList module
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias AnimeList.Accounts.User
  alias AnimeList.Animes.Anime

  @primary_key false
  schema "anime_lists" do
    belongs_to(:anime, Anime, primary_key: true)
    belongs_to(:user, User, primary_key: true)

    timestamps()
  end

  @required_fields ~w(anime_id, user_id)a

  def changeset(anime_list_entry \\ %__MODULE__{}, params \\ %{}) do
    anime_list_entry
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:anime_id)
    |> foreign_key_constraint(:user_id)
    |> unique_constraint([:user, :anime],
      name: :user_id_anime_id_unique_index,
      message: "ALREADY_EXISTS"
    )
  end
end
