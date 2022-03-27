defmodule Planilha.ContasTest do
  use Planilha.DataCase

  alias Planilha.Contas

  describe "contas" do
    alias Planilha.Contas.Conta

    import Planilha.ContasFixtures

    @invalid_attrs %{balanco: nil, nome: nil}

    test "list_contas/0 returns all contas" do
      conta = conta_fixture()
      assert Contas.list_contas() == [conta]
    end

    test "get_conta!/1 returns the conta with given id" do
      conta = conta_fixture()
      assert Contas.get_conta!(conta.id) == conta
    end

    test "create_conta/1 with valid data creates a conta" do
      valid_attrs = %{balanco: 42, nome: "some nome"}

      assert {:ok, %Conta{} = conta} = Contas.create_conta(valid_attrs)
      assert conta.balanco == 42
      assert conta.nome == "some nome"
    end

    test "create_conta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contas.create_conta(@invalid_attrs)
    end

    test "update_conta/2 with valid data updates the conta" do
      conta = conta_fixture()
      update_attrs = %{balanco: 43, nome: "some updated nome"}

      assert {:ok, %Conta{} = conta} = Contas.update_conta(conta, update_attrs)
      assert conta.balanco == 43
      assert conta.nome == "some updated nome"
    end

    test "update_conta/2 with invalid data returns error changeset" do
      conta = conta_fixture()
      assert {:error, %Ecto.Changeset{}} = Contas.update_conta(conta, @invalid_attrs)
      assert conta == Contas.get_conta!(conta.id)
    end

    test "delete_conta/1 deletes the conta" do
      conta = conta_fixture()
      assert {:ok, %Conta{}} = Contas.delete_conta(conta)
      assert_raise Ecto.NoResultsError, fn -> Contas.get_conta!(conta.id) end
    end

    test "change_conta/1 returns a conta changeset" do
      conta = conta_fixture()
      assert %Ecto.Changeset{} = Contas.change_conta(conta)
    end
  end
end
