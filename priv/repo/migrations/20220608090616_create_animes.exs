defmodule AnimeList.Repo.Migrations.CreateAnimes do
  use Ecto.Migration

  def change do
    create table(:animes) do
      add :name, :string
      add :episodes, :integer
      add :image_url, :string
      add :description, :string

      timestamps()
    end
  end
end
