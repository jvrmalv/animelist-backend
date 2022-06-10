defmodule AnimeListWeb.AnimeController do
  use AnimeListWeb, :controller

  alias AnimeList.Animes
  alias AnimeList.Animes.Anime

  action_fallback AnimeListWeb.FallbackController

  def index(conn, _params) do
    animes = Animes.list_animes()
    render(conn, "index.json", animes: animes)
  end

  def create(conn, %{"anime" => anime_params}) do
    with {:ok, %Anime{} = anime} <- Animes.create_anime(anime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.anime_path(conn, :show, anime))
      |> render("show.json", anime: anime)
    end
  end

  def show(conn, %{"id" => id}) do
    anime = Animes.get_anime!(id)
    render(conn, "show.json", anime: anime)
  end

  def update(conn, %{"id" => id, "anime" => anime_params}) do
    anime = Animes.get_anime!(id)

    with {:ok, %Anime{} = anime} <- Animes.update_anime(anime, anime_params) do
      render(conn, "show.json", anime: anime)
    end
  end

  def delete(conn, %{"id" => id}) do
    anime = Animes.get_anime!(id)

    with {:ok, %Anime{}} <- Animes.delete_anime(anime) do
      send_resp(conn, :no_content, "")
    end
  end
end
