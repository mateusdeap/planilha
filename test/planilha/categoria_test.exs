defmodule Planilha.CategoriaTest do
  use Planilha.DataCase

  alias Planilha.Categoria

  describe "categorias" do
    alias Planilha.Categoria.Categorias

    import Planilha.CategoriaFixtures

    @invalid_attrs %{descricao: nil}

    test "list_categorias/0 returns all categorias" do
      categorias = categorias_fixture()
      assert Categoria.list_categorias() == [categorias]
    end

    test "get_categorias!/1 returns the categorias with given id" do
      categorias = categorias_fixture()
      assert Categoria.get_categorias!(categorias.id) == categorias
    end

    test "create_categorias/1 with valid data creates a categorias" do
      valid_attrs = %{descricao: "some descricao"}

      assert {:ok, %Categorias{} = categorias} = Categoria.create_categorias(valid_attrs)
      assert categorias.descricao == "some descricao"
    end

    test "create_categorias/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categoria.create_categorias(@invalid_attrs)
    end

    test "update_categorias/2 with valid data updates the categorias" do
      categorias = categorias_fixture()
      update_attrs = %{descricao: "some updated descricao"}

      assert {:ok, %Categorias{} = categorias} = Categoria.update_categorias(categorias, update_attrs)
      assert categorias.descricao == "some updated descricao"
    end

    test "update_categorias/2 with invalid data returns error changeset" do
      categorias = categorias_fixture()
      assert {:error, %Ecto.Changeset{}} = Categoria.update_categorias(categorias, @invalid_attrs)
      assert categorias == Categoria.get_categorias!(categorias.id)
    end

    test "delete_categorias/1 deletes the categorias" do
      categorias = categorias_fixture()
      assert {:ok, %Categorias{}} = Categoria.delete_categorias(categorias)
      assert_raise Ecto.NoResultsError, fn -> Categoria.get_categorias!(categorias.id) end
    end

    test "change_categorias/1 returns a categorias changeset" do
      categorias = categorias_fixture()
      assert %Ecto.Changeset{} = Categoria.change_categorias(categorias)
    end
  end
end
