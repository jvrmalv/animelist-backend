defmodule AnimeList.Repo.Migrations.AddAnimelistTable do
  use Ecto.Migration

  def change do
    create table(:anime_list, primary_key: false) do
      add(:anime_id, references(:animes, on_delete: :delete_all), primary_key: true)
      add(:user_id, references(:users, on_delete: :delete_all), primary_key: true)
      timestamps()
    end

    create(index(:user_project, [:project_id]))
    create(index(:user_project, [:user_id]))
  end
end
