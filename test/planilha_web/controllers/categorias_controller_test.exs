defmodule PlanilhaWeb.CategoriasControllerTest do
  use PlanilhaWeb.ConnCase

  import Planilha.CategoriaFixtures

  @create_attrs %{descricao: "some descricao"}
  @update_attrs %{descricao: "some updated descricao"}
  @invalid_attrs %{descricao: nil}

  describe "index" do
    test "lists all categorias", %{conn: conn} do
      conn = get(conn, Routes.categorias_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Categorias"
    end
  end

  describe "new categorias" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.categorias_path(conn, :new))
      assert html_response(conn, 200) =~ "New Categorias"
    end
  end

  describe "create categorias" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.categorias_path(conn, :create), categorias: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.categorias_path(conn, :show, id)

      conn = get(conn, Routes.categorias_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Categorias"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.categorias_path(conn, :create), categorias: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Categorias"
    end
  end

  describe "edit categorias" do
    setup [:create_categorias]

    test "renders form for editing chosen categorias", %{conn: conn, categorias: categorias} do
      conn = get(conn, Routes.categorias_path(conn, :edit, categorias))
      assert html_response(conn, 200) =~ "Edit Categorias"
    end
  end

  describe "update categorias" do
    setup [:create_categorias]

    test "redirects when data is valid", %{conn: conn, categorias: categorias} do
      conn = put(conn, Routes.categorias_path(conn, :update, categorias), categorias: @update_attrs)
      assert redirected_to(conn) == Routes.categorias_path(conn, :show, categorias)

      conn = get(conn, Routes.categorias_path(conn, :show, categorias))
      assert html_response(conn, 200) =~ "some updated descricao"
    end

    test "renders errors when data is invalid", %{conn: conn, categorias: categorias} do
      conn = put(conn, Routes.categorias_path(conn, :update, categorias), categorias: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Categorias"
    end
  end

  describe "delete categorias" do
    setup [:create_categorias]

    test "deletes chosen categorias", %{conn: conn, categorias: categorias} do
      conn = delete(conn, Routes.categorias_path(conn, :delete, categorias))
      assert redirected_to(conn) == Routes.categorias_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.categorias_path(conn, :show, categorias))
      end
    end
  end

  defp create_categorias(_) do
    categorias = categorias_fixture()
    %{categorias: categorias}
  end
end
