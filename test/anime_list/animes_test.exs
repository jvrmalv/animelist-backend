defmodule AnimeList.AnimesTest do
  use AnimeList.DataCase

  alias AnimeList.Animes

  describe "animes" do
    alias AnimeList.Animes.Anime

    import AnimeList.AnimesFixtures

    @invalid_attrs %{description: nil, episodes: nil, image_url: nil, name: nil}

    test "list_animes/0 returns all animes" do
      anime = anime_fixture()
      assert Animes.list_animes() == [anime]
    end

    test "get_anime!/1 returns the anime with given id" do
      anime = anime_fixture()
      assert Animes.get_anime!(anime.id) == anime
    end

    test "create_anime/1 with valid data creates a anime" do
      valid_attrs = %{description: "some description", episodes: 42, image_url: "some image_url", name: "some name"}

      assert {:ok, %Anime{} = anime} = Animes.create_anime(valid_attrs)
      assert anime.description == "some description"
      assert anime.episodes == 42
      assert anime.image_url == "some image_url"
      assert anime.name == "some name"
    end

    test "create_anime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animes.create_anime(@invalid_attrs)
    end

    test "update_anime/2 with valid data updates the anime" do
      anime = anime_fixture()
      update_attrs = %{description: "some updated description", episodes: 43, image_url: "some updated image_url", name: "some updated name"}

      assert {:ok, %Anime{} = anime} = Animes.update_anime(anime, update_attrs)
      assert anime.description == "some updated description"
      assert anime.episodes == 43
      assert anime.image_url == "some updated image_url"
      assert anime.name == "some updated name"
    end

    test "update_anime/2 with invalid data returns error changeset" do
      anime = anime_fixture()
      assert {:error, %Ecto.Changeset{}} = Animes.update_anime(anime, @invalid_attrs)
      assert anime == Animes.get_anime!(anime.id)
    end

    test "delete_anime/1 deletes the anime" do
      anime = anime_fixture()
      assert {:ok, %Anime{}} = Animes.delete_anime(anime)
      assert_raise Ecto.NoResultsError, fn -> Animes.get_anime!(anime.id) end
    end

    test "change_anime/1 returns a anime changeset" do
      anime = anime_fixture()
      assert %Ecto.Changeset{} = Animes.change_anime(anime)
    end
  end
end
