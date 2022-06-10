defmodule AnimeListWeb.AnimeControllerTest do
  use AnimeListWeb.ConnCase

  import AnimeList.AnimesFixtures

  alias AnimeList.Animes.Anime

  @create_attrs %{
    description: "some description",
    episodes: 42,
    image_url: "some image_url",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    episodes: 43,
    image_url: "some updated image_url",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, episodes: nil, image_url: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all animes", %{conn: conn} do
      conn = get(conn, Routes.anime_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create anime" do
    test "renders anime when data is valid", %{conn: conn} do
      conn = post(conn, Routes.anime_path(conn, :create), anime: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.anime_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "episodes" => 42,
               "image_url" => "some image_url",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.anime_path(conn, :create), anime: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update anime" do
    setup [:create_anime]

    test "renders anime when data is valid", %{conn: conn, anime: %Anime{id: id} = anime} do
      conn = put(conn, Routes.anime_path(conn, :update, anime), anime: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.anime_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "episodes" => 43,
               "image_url" => "some updated image_url",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, anime: anime} do
      conn = put(conn, Routes.anime_path(conn, :update, anime), anime: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete anime" do
    setup [:create_anime]

    test "deletes chosen anime", %{conn: conn, anime: anime} do
      conn = delete(conn, Routes.anime_path(conn, :delete, anime))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.anime_path(conn, :show, anime))
      end
    end
  end

  defp create_anime(_) do
    anime = anime_fixture()
    %{anime: anime}
  end
end
