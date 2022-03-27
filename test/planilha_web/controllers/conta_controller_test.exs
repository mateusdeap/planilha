defmodule PlanilhaWeb.ContaControllerTest do
  use PlanilhaWeb.ConnCase

  import Planilha.ContasFixtures

  @create_attrs %{balanco: 42, nome: "some nome"}
  @update_attrs %{balanco: 43, nome: "some updated nome"}
  @invalid_attrs %{balanco: nil, nome: nil}

  describe "index" do
    test "lists all contas", %{conn: conn} do
      conn = get(conn, Routes.conta_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contas"
    end
  end

  describe "new conta" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.conta_path(conn, :new))
      assert html_response(conn, 200) =~ "New Conta"
    end
  end

  describe "create conta" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.conta_path(conn, :create), conta: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.conta_path(conn, :show, id)

      conn = get(conn, Routes.conta_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Conta"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.conta_path(conn, :create), conta: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Conta"
    end
  end

  describe "edit conta" do
    setup [:create_conta]

    test "renders form for editing chosen conta", %{conn: conn, conta: conta} do
      conn = get(conn, Routes.conta_path(conn, :edit, conta))
      assert html_response(conn, 200) =~ "Edit Conta"
    end
  end

  describe "update conta" do
    setup [:create_conta]

    test "redirects when data is valid", %{conn: conn, conta: conta} do
      conn = put(conn, Routes.conta_path(conn, :update, conta), conta: @update_attrs)
      assert redirected_to(conn) == Routes.conta_path(conn, :show, conta)

      conn = get(conn, Routes.conta_path(conn, :show, conta))
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, conta: conta} do
      conn = put(conn, Routes.conta_path(conn, :update, conta), conta: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Conta"
    end
  end

  describe "delete conta" do
    setup [:create_conta]

    test "deletes chosen conta", %{conn: conn, conta: conta} do
      conn = delete(conn, Routes.conta_path(conn, :delete, conta))
      assert redirected_to(conn) == Routes.conta_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.conta_path(conn, :show, conta))
      end
    end
  end

  defp create_conta(_) do
    conta = conta_fixture()
    %{conta: conta}
  end
end
