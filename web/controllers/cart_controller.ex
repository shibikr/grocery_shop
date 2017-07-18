defmodule Groceryshop.CartController do
  use Groceryshop.Web, :controller

  alias Groceryshop.Cart

  def index(conn, _params) do
    carts = Repo.all(Cart)
    render(conn, "index.html", carts: carts)
  end

  def new(conn, _params) do
    changeset = Cart.changeset(%Cart{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cart" => cart_params}) do
    changeset = Cart.changeset(%Cart{}, cart_params)

    case Repo.insert(changeset) do
      {:ok, _cart} ->
        conn
        |> put_flash(:info, "Cart created successfully.")
        |> redirect(to: cart_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cart = Repo.get!(Cart, id)
    render(conn, "show.html", cart: cart)
  end

  def edit(conn, %{"id" => id}) do
    cart = Repo.get!(Cart, id)
    changeset = Cart.changeset(cart)
    render(conn, "edit.html", cart: cart, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cart" => cart_params}) do
    cart = Repo.get!(Cart, id)
    changeset = Cart.changeset(cart, cart_params)

    case Repo.update(changeset) do
      {:ok, cart} ->
        conn
        |> put_flash(:info, "Cart updated successfully.")
        |> redirect(to: cart_path(conn, :show, cart))
      {:error, changeset} ->
        render(conn, "edit.html", cart: cart, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart = Repo.get!(Cart, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cart)

    conn
    |> put_flash(:info, "Cart deleted successfully.")
    |> redirect(to: cart_path(conn, :index))
  end
end
