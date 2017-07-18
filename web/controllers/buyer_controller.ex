defmodule Groceryshop.BuyerController do
  use Groceryshop.Web, :controller

  alias Groceryshop.Buyer

  def index(conn, _params) do
    buyers = Repo.all(Buyer)
    render(conn, "index.html", buyers: buyers)
  end

  def new(conn, _params) do
    changeset = Buyer.changeset(%Buyer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"buyer" => buyer_params}) do
    changeset = Buyer.changeset(%Buyer{}, buyer_params)

    case Repo.insert(changeset) do
      {:ok, _buyer} ->
        conn
        |> put_flash(:info, "Buyer created successfully.")
        |> redirect(to: buyer_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    buyer = Repo.get!(Buyer, id)
    render(conn, "show.html", buyer: buyer)
  end

  def edit(conn, %{"id" => id}) do
    buyer = Repo.get!(Buyer, id)
    changeset = Buyer.changeset(buyer)
    render(conn, "edit.html", buyer: buyer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "buyer" => buyer_params}) do
    buyer = Repo.get!(Buyer, id)
    changeset = Buyer.changeset(buyer, buyer_params)

    case Repo.update(changeset) do
      {:ok, buyer} ->
        conn
        |> put_flash(:info, "Buyer updated successfully.")
        |> redirect(to: buyer_path(conn, :show, buyer))
      {:error, changeset} ->
        render(conn, "edit.html", buyer: buyer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    buyer = Repo.get!(Buyer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(buyer)

    conn
    |> put_flash(:info, "Buyer deleted successfully.")
    |> redirect(to: buyer_path(conn, :index))
  end
end
