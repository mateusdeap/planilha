defmodule PlanilhaWeb.CategoriaController do
  use PlanilhaWeb, :controller

  alias Planilha.Categorias
  alias Planilha.Categorias.Categoria

  def index(conn, _params) do
    categorias = Categorias.list_categorias()
    render(conn, "index.html", categorias: categorias)
  end

  def new(conn, _params) do
    changeset = Categorias.change_categoria(%Categoria{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"categoria" => categoria_params}) do
    case Categorias.create_categoria(categoria_params) do
      {:ok, categoria} ->
        conn
        |> put_flash(:info, "Categoria created successfully.")
        |> redirect(to: Routes.categoria_path(conn, :show, categoria))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    categoria = Categorias.get_categoria!(id)
    render(conn, "show.html", categoria: categoria)
  end

  def edit(conn, %{"id" => id}) do
    categoria = Categorias.get_categoria!(id)
    changeset = Categorias.change_categoria(categoria)
    render(conn, "edit.html", categoria: categoria, changeset: changeset)
  end

  def update(conn, %{"id" => id, "categoria" => categoria_params}) do
    categoria = Categorias.get_categoria!(id)

    case Categorias.update_categoria(categoria, categoria_params) do
      {:ok, categoria} ->
        conn
        |> put_flash(:info, "Categoria updated successfully.")
        |> redirect(to: Routes.categoria_path(conn, :show, categoria))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", categoria: categoria, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    categoria = Categorias.get_categoria!(id)
    {:ok, _categoria} = Categorias.delete_categoria(categoria)

    conn
    |> put_flash(:info, "Categoria deleted successfully.")
    |> redirect(to: Routes.categoria_path(conn, :index))
  end
end
