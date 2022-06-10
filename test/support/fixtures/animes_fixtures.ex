defmodule AnimeList.AnimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AnimeList.Animes` context.
  """

  @doc """
  Generate a anime.
  """
  def anime_fixture(attrs \\ %{}) do
    {:ok, anime} =
      attrs
      |> Enum.into(%{
        description: "some description",
        episodes: 42,
        image_url: "some image_url",
        name: "some name"
      })
      |> AnimeList.Animes.create_anime()

    anime
  end
end
