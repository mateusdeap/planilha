defmodule PlanilhaWeb.CategoriaControllerTest do
  use PlanilhaWeb.ConnCase

  import Planilha.CategoriasFixtures

  @create_attrs %{descricao: "some descricao"}
  @update_attrs %{descricao: "some updated descricao"}
  @invalid_attrs %{descricao: nil}

  describe "index" do
    test "lists all categorias", %{conn: conn} do
      conn = get(conn, Routes.categoria_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Categorias"
    end
  end

  describe "new categoria" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.categoria_path(conn, :new))
      assert html_response(conn, 200) =~ "New Categoria"
    end
  end

  describe "create categoria" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.categoria_path(conn, :create), categoria: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.categoria_path(conn, :show, id)

      conn = get(conn, Routes.categoria_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Categoria"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.categoria_path(conn, :create), categoria: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Categoria"
    end
  end

  describe "edit categoria" do
    setup [:create_categoria]

    test "renders form for editing chosen categoria", %{conn: conn, categoria: categoria} do
      conn = get(conn, Routes.categoria_path(conn, :edit, categoria))
      assert html_response(conn, 200) =~ "Edit Categoria"
    end
  end

  describe "update categoria" do
    setup [:create_categoria]

    test "redirects when data is valid", %{conn: conn, categoria: categoria} do
      conn = put(conn, Routes.categoria_path(conn, :update, categoria), categoria: @update_attrs)
      assert redirected_to(conn) == Routes.categoria_path(conn, :show, categoria)

      conn = get(conn, Routes.categoria_path(conn, :show, categoria))
      assert html_response(conn, 200) =~ "some updated descricao"
    end

    test "renders errors when data is invalid", %{conn: conn, categoria: categoria} do
      conn = put(conn, Routes.categoria_path(conn, :update, categoria), categoria: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Categoria"
    end
  end

  describe "delete categoria" do
    setup [:create_categoria]

    test "deletes chosen categoria", %{conn: conn, categoria: categoria} do
      conn = delete(conn, Routes.categoria_path(conn, :delete, categoria))
      assert redirected_to(conn) == Routes.categoria_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.categoria_path(conn, :show, categoria))
      end
    end
  end

  defp create_categoria(_) do
    categoria = categoria_fixture()
    %{categoria: categoria}
  end
end
