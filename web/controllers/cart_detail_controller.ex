defmodule Groceryshop.CartDetailController do
  use Groceryshop.Web, :controller

  alias Groceryshop.CartDetail

  def index(conn, _params) do
    cart_details = Repo.all(CartDetail)
    render(conn, "index.html", cart_details: cart_details)
  end

  def new(conn, _params) do
    changeset = CartDetail.changeset(%CartDetail{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cart_detail" => cart_detail_params}) do
    changeset = CartDetail.changeset(%CartDetail{}, cart_detail_params)

    case Repo.insert(changeset) do
      {:ok, _cart_detail} ->
        conn
        |> put_flash(:info, "Cart detail created successfully.")
        |> redirect(to: cart_detail_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cart_detail = Repo.get!(CartDetail, id)
    render(conn, "show.html", cart_detail: cart_detail)
  end

  def edit(conn, %{"id" => id}) do
    cart_detail = Repo.get!(CartDetail, id)
    changeset = CartDetail.changeset(cart_detail)
    render(conn, "edit.html", cart_detail: cart_detail, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cart_detail" => cart_detail_params}) do
    cart_detail = Repo.get!(CartDetail, id)
    changeset = CartDetail.changeset(cart_detail, cart_detail_params)

    case Repo.update(changeset) do
      {:ok, cart_detail} ->
        conn
        |> put_flash(:info, "Cart detail updated successfully.")
        |> redirect(to: cart_detail_path(conn, :show, cart_detail))
      {:error, changeset} ->
        render(conn, "edit.html", cart_detail: cart_detail, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart_detail = Repo.get!(CartDetail, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cart_detail)

    conn
    |> put_flash(:info, "Cart detail deleted successfully.")
    |> redirect(to: cart_detail_path(conn, :index))
  end
end
