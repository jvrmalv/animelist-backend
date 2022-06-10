defmodule AnimeListWeb.AnimeView do
  use AnimeListWeb, :view
  alias AnimeListWeb.AnimeView

  def render("index.json", %{animes: animes}) do
    %{data: render_many(animes, AnimeView, "anime.json")}
  end

  def render("show.json", %{anime: anime}) do
    %{data: render_one(anime, AnimeView, "anime.json")}
  end

  def render("anime.json", %{anime: anime}) do
    %{
      id: anime.id,
      name: anime.name,
      episodes: anime.episodes,
      image_url: anime.image_url,
      description: anime.description
    }
  end
end
