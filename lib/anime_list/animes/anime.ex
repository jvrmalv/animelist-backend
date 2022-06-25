defmodule AnimeList.Animes.Anime do
  use Ecto.Schema
  import Ecto.Changeset

  belongs_to
  schema "animes" do
    field :description, :string
    field :episodes, :integer
    field :image_url, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(anime, attrs) do
    anime
    |> cast(attrs, [:name, :episodes, :image_url, :description])
    |> validate_required([:name, :episodes, :image_url, :description])
  end
end
