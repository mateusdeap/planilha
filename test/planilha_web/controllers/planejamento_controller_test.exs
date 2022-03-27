defmodule PlanilhaWeb.PlanejamentoControllerTest do
  use PlanilhaWeb.ConnCase

  import Planilha.PlanejamentosFixtures

  @create_attrs %{gasto_total_atual: 42, gasto_total_planejado: 42, mes: "some mes", renda_total_atual: 42, renda_total_panejada: 42}
  @update_attrs %{gasto_total_atual: 43, gasto_total_planejado: 43, mes: "some updated mes", renda_total_atual: 43, renda_total_panejada: 43}
  @invalid_attrs %{gasto_total_atual: nil, gasto_total_planejado: nil, mes: nil, renda_total_atual: nil, renda_total_panejada: nil}

  describe "index" do
    test "lists all planejamentos", %{conn: conn} do
      conn = get(conn, Routes.planejamento_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Planejamentos"
    end
  end

  describe "new planejamento" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.planejamento_path(conn, :new))
      assert html_response(conn, 200) =~ "New Planejamento"
    end
  end

  describe "create planejamento" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.planejamento_path(conn, :create), planejamento: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.planejamento_path(conn, :show, id)

      conn = get(conn, Routes.planejamento_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Planejamento"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.planejamento_path(conn, :create), planejamento: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Planejamento"
    end
  end

  describe "edit planejamento" do
    setup [:create_planejamento]

    test "renders form for editing chosen planejamento", %{conn: conn, planejamento: planejamento} do
      conn = get(conn, Routes.planejamento_path(conn, :edit, planejamento))
      assert html_response(conn, 200) =~ "Edit Planejamento"
    end
  end

  describe "update planejamento" do
    setup [:create_planejamento]

    test "redirects when data is valid", %{conn: conn, planejamento: planejamento} do
      conn = put(conn, Routes.planejamento_path(conn, :update, planejamento), planejamento: @update_attrs)
      assert redirected_to(conn) == Routes.planejamento_path(conn, :show, planejamento)

      conn = get(conn, Routes.planejamento_path(conn, :show, planejamento))
      assert html_response(conn, 200) =~ "some updated mes"
    end

    test "renders errors when data is invalid", %{conn: conn, planejamento: planejamento} do
      conn = put(conn, Routes.planejamento_path(conn, :update, planejamento), planejamento: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Planejamento"
    end
  end

  describe "delete planejamento" do
    setup [:create_planejamento]

    test "deletes chosen planejamento", %{conn: conn, planejamento: planejamento} do
      conn = delete(conn, Routes.planejamento_path(conn, :delete, planejamento))
      assert redirected_to(conn) == Routes.planejamento_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.planejamento_path(conn, :show, planejamento))
      end
    end
  end

  defp create_planejamento(_) do
    planejamento = planejamento_fixture()
    %{planejamento: planejamento}
  end
end
