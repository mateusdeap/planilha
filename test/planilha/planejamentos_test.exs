defmodule Planilha.PlanejamentosTest do
  use Planilha.DataCase

  alias Planilha.Planejamentos

  describe "planejamentos" do
    alias Planilha.Planejamentos.Planejamento

    import Planilha.PlanejamentosFixtures

    @invalid_attrs %{gasto_total_atual: nil, gasto_total_planejado: nil, mes: nil, renda_total_atual: nil, renda_total_panejada: nil}

    test "list_planejamentos/0 returns all planejamentos" do
      planejamento = planejamento_fixture()
      assert Planejamentos.list_planejamentos() == [planejamento]
    end

    test "get_planejamento!/1 returns the planejamento with given id" do
      planejamento = planejamento_fixture()
      assert Planejamentos.get_planejamento!(planejamento.id) == planejamento
    end

    test "create_planejamento/1 with valid data creates a planejamento" do
      valid_attrs = %{gasto_total_atual: 42, gasto_total_planejado: 42, mes: "some mes", renda_total_atual: 42, renda_total_panejada: 42}

      assert {:ok, %Planejamento{} = planejamento} = Planejamentos.create_planejamento(valid_attrs)
      assert planejamento.gasto_total_atual == 42
      assert planejamento.gasto_total_planejado == 42
      assert planejamento.mes == "some mes"
      assert planejamento.renda_total_atual == 42
      assert planejamento.renda_total_panejada == 42
    end

    test "create_planejamento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Planejamentos.create_planejamento(@invalid_attrs)
    end

    test "update_planejamento/2 with valid data updates the planejamento" do
      planejamento = planejamento_fixture()
      update_attrs = %{gasto_total_atual: 43, gasto_total_planejado: 43, mes: "some updated mes", renda_total_atual: 43, renda_total_panejada: 43}

      assert {:ok, %Planejamento{} = planejamento} = Planejamentos.update_planejamento(planejamento, update_attrs)
      assert planejamento.gasto_total_atual == 43
      assert planejamento.gasto_total_planejado == 43
      assert planejamento.mes == "some updated mes"
      assert planejamento.renda_total_atual == 43
      assert planejamento.renda_total_panejada == 43
    end

    test "update_planejamento/2 with invalid data returns error changeset" do
      planejamento = planejamento_fixture()
      assert {:error, %Ecto.Changeset{}} = Planejamentos.update_planejamento(planejamento, @invalid_attrs)
      assert planejamento == Planejamentos.get_planejamento!(planejamento.id)
    end

    test "delete_planejamento/1 deletes the planejamento" do
      planejamento = planejamento_fixture()
      assert {:ok, %Planejamento{}} = Planejamentos.delete_planejamento(planejamento)
      assert_raise Ecto.NoResultsError, fn -> Planejamentos.get_planejamento!(planejamento.id) end
    end

    test "change_planejamento/1 returns a planejamento changeset" do
      planejamento = planejamento_fixture()
      assert %Ecto.Changeset{} = Planejamentos.change_planejamento(planejamento)
    end
  end
end
