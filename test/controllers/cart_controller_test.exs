defmodule Groceryshop.CartControllerTest do
  use Groceryshop.ConnCase

  alias Groceryshop.Cart
  alias Groceryshop.Buyer
  @buyer_valid_attrs %{email: "john@doe.me", name: "John Doe"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cart_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing carts"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, cart_path(conn, :new)
    assert html_response(conn, 200) =~ "New cart"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    Repo.insert! Buyer.changeset(%Buyer{}, @buyer_valid_attrs)
    buyer = Repo.get_by(Buyer, email: "john@doe.me")
    cart = %{buyer_id: buyer.id}

    conn = post conn, cart_path(conn, :create), cart: cart
    assert redirected_to(conn) == cart_path(conn, :index)
    assert Repo.get_by(Cart, cart)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cart_path(conn, :create), cart: @invalid_attrs
    assert html_response(conn, 200) =~ "New cart"
  end

  test "shows chosen resource", %{conn: conn} do
    Repo.insert! Buyer.changeset(%Buyer{}, @buyer_valid_attrs)
    buyer = Repo.get_by(Buyer, email: "john@doe.me")

    cart = Repo.insert! Cart.changeset(%Cart{}, %{buyer_id: buyer.id})
    conn = get conn, cart_path(conn, :show, cart)
    assert html_response(conn, 200) =~ "Show cart"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, cart_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    Repo.insert! Buyer.changeset(%Buyer{}, @buyer_valid_attrs)
    buyer = Repo.get_by(Buyer, email: "john@doe.me")

    cart = Repo.insert! Cart.changeset(%Cart{}, %{buyer_id: buyer.id})
    conn = get conn, cart_path(conn, :edit, cart)
    assert html_response(conn, 200) =~ "Edit cart"
  end

  test "deletes chosen resource", %{conn: conn} do
    Repo.insert! Buyer.changeset(%Buyer{}, @buyer_valid_attrs)
    buyer = Repo.get_by(Buyer, email: "john@doe.me")

    cart = Repo.insert! Cart.changeset(%Cart{}, %{buyer_id: buyer.id})
    conn = delete conn, cart_path(conn, :delete, cart)
    assert redirected_to(conn) == cart_path(conn, :index)
    refute Repo.get(Cart, cart.id)
  end
end
