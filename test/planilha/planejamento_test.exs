defmodule Planilha.PlanejamentoTest do
  use Planilha.DataCase

  alias Planilha.Planejamento

  describe "planejamentos" do
    alias Planilha.Planejamento.Planejamentos

    import Planilha.PlanejamentoFixtures

    @invalid_attrs %{gasto_total_atual: nil, gasto_total_planejado: nil, mes: nil, renda_total_atual: nil, renda_total_panejada: nil}

    test "list_planejamentos/0 returns all planejamentos" do
      planejamentos = planejamentos_fixture()
      assert Planejamento.list_planejamentos() == [planejamentos]
    end

    test "get_planejamentos!/1 returns the planejamentos with given id" do
      planejamentos = planejamentos_fixture()
      assert Planejamento.get_planejamentos!(planejamentos.id) == planejamentos
    end

    test "create_planejamentos/1 with valid data creates a planejamentos" do
      valid_attrs = %{gasto_total_atual: 42, gasto_total_planejado: 42, mes: "some mes", renda_total_atual: 42, renda_total_panejada: 42}

      assert {:ok, %Planejamentos{} = planejamentos} = Planejamento.create_planejamentos(valid_attrs)
      assert planejamentos.gasto_total_atual == 42
      assert planejamentos.gasto_total_planejado == 42
      assert planejamentos.mes == "some mes"
      assert planejamentos.renda_total_atual == 42
      assert planejamentos.renda_total_panejada == 42
    end

    test "create_planejamentos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Planejamento.create_planejamentos(@invalid_attrs)
    end

    test "update_planejamentos/2 with valid data updates the planejamentos" do
      planejamentos = planejamentos_fixture()
      update_attrs = %{gasto_total_atual: 43, gasto_total_planejado: 43, mes: "some updated mes", renda_total_atual: 43, renda_total_panejada: 43}

      assert {:ok, %Planejamentos{} = planejamentos} = Planejamento.update_planejamentos(planejamentos, update_attrs)
      assert planejamentos.gasto_total_atual == 43
      assert planejamentos.gasto_total_planejado == 43
      assert planejamentos.mes == "some updated mes"
      assert planejamentos.renda_total_atual == 43
      assert planejamentos.renda_total_panejada == 43
    end

    test "update_planejamentos/2 with invalid data returns error changeset" do
      planejamentos = planejamentos_fixture()
      assert {:error, %Ecto.Changeset{}} = Planejamento.update_planejamentos(planejamentos, @invalid_attrs)
      assert planejamentos == Planejamento.get_planejamentos!(planejamentos.id)
    end

    test "delete_planejamentos/1 deletes the planejamentos" do
      planejamentos = planejamentos_fixture()
      assert {:ok, %Planejamentos{}} = Planejamento.delete_planejamentos(planejamentos)
      assert_raise Ecto.NoResultsError, fn -> Planejamento.get_planejamentos!(planejamentos.id) end
    end

    test "change_planejamentos/1 returns a planejamentos changeset" do
      planejamentos = planejamentos_fixture()
      assert %Ecto.Changeset{} = Planejamento.change_planejamentos(planejamentos)
    end
  end
end
