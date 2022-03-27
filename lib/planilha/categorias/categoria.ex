defmodule Planilha.Categorias.Categoria do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categorias" do
    field :descricao, :string
    many_to_many :planejamentos, Planilha.Planejamentos.Planejamento, join_through: "categorias_planejamentos"

    timestamps()
  end

  @doc false
  def changeset(categoria, attrs) do
    categoria
    |> cast(attrs, [:descricao])
    |> validate_required([:descricao])
  end
end
