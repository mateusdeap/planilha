defmodule Planilha.Contas.Conta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contas" do
    field :balanco, Money.Ecto.Amount.Type
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(conta, attrs) do
    conta
    |> cast(attrs, [:nome, :balanco])
    |> validate_required([:nome, :balanco])
  end
end
