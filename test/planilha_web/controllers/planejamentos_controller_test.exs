defmodule PlanilhaWeb.PlanejamentosControllerTest do
  use PlanilhaWeb.ConnCase

  import Planilha.PlanejamentoFixtures

  @create_attrs %{gasto_total_atual: 42, gasto_total_planejado: 42, mes: "some mes", renda_total_atual: 42, renda_total_panejada: 42}
  @update_attrs %{gasto_total_atual: 43, gasto_total_planejado: 43, mes: "some updated mes", renda_total_atual: 43, renda_total_panejada: 43}
  @invalid_attrs %{gasto_total_atual: nil, gasto_total_planejado: nil, mes: nil, renda_total_atual: nil, renda_total_panejada: nil}

  describe "index" do
    test "lists all planejamentos", %{conn: conn} do
      conn = get(conn, Routes.planejamentos_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Planejamentos"
    end
  end

  describe "new planejamentos" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.planejamentos_path(conn, :new))
      assert html_response(conn, 200) =~ "New Planejamentos"
    end
  end

  describe "create planejamentos" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.planejamentos_path(conn, :create), planejamentos: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.planejamentos_path(conn, :show, id)

      conn = get(conn, Routes.planejamentos_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Planejamentos"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.planejamentos_path(conn, :create), planejamentos: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Planejamentos"
    end
  end

  describe "edit planejamentos" do
    setup [:create_planejamentos]

    test "renders form for editing chosen planejamentos", %{conn: conn, planejamentos: planejamentos} do
      conn = get(conn, Routes.planejamentos_path(conn, :edit, planejamentos))
      assert html_response(conn, 200) =~ "Edit Planejamentos"
    end
  end

  describe "update planejamentos" do
    setup [:create_planejamentos]

    test "redirects when data is valid", %{conn: conn, planejamentos: planejamentos} do
      conn = put(conn, Routes.planejamentos_path(conn, :update, planejamentos), planejamentos: @update_attrs)
      assert redirected_to(conn) == Routes.planejamentos_path(conn, :show, planejamentos)

      conn = get(conn, Routes.planejamentos_path(conn, :show, planejamentos))
      assert html_response(conn, 200) =~ "some updated mes"
    end

    test "renders errors when data is invalid", %{conn: conn, planejamentos: planejamentos} do
      conn = put(conn, Routes.planejamentos_path(conn, :update, planejamentos), planejamentos: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Planejamentos"
    end
  end

  describe "delete planejamentos" do
    setup [:create_planejamentos]

    test "deletes chosen planejamentos", %{conn: conn, planejamentos: planejamentos} do
      conn = delete(conn, Routes.planejamentos_path(conn, :delete, planejamentos))
      assert redirected_to(conn) == Routes.planejamentos_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.planejamentos_path(conn, :show, planejamentos))
      end
    end
  end

  defp create_planejamentos(_) do
    planejamentos = planejamentos_fixture()
    %{planejamentos: planejamentos}
  end
end
