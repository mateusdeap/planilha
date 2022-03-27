defmodule Planilha.Planejamentos.Planejamento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "planejamentos" do
    field :gasto_total_atual, :integer
    field :gasto_total_planejado, :integer
    field :mes, :string
    field :renda_total_atual, :integer
    field :renda_total_panejada, :integer
    many_to_many :categorias, Planilha.Categorias.Categoria, join_through: "categorias_planejamentos"

    timestamps()
  end

  @doc false
  def changeset(planejamento, attrs) do
    planejamento
    |> cast(attrs, [:mes, :gasto_total_planejado, :gasto_total_atual, :renda_total_panejada, :renda_total_atual])
    |> validate_required([:mes, :gasto_total_planejado, :gasto_total_atual, :renda_total_panejada, :renda_total_atual])
  end
end
