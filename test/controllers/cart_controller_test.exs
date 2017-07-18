defmodule Groceryshop.CartControllerTest do
  use Groceryshop.ConnCase

  alias Groceryshop.Cart
  @valid_attrs %{}
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
    conn = post conn, cart_path(conn, :create), cart: @valid_attrs
    assert redirected_to(conn) == cart_path(conn, :index)
    assert Repo.get_by(Cart, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cart_path(conn, :create), cart: @invalid_attrs
    assert html_response(conn, 200) =~ "New cart"
  end

  test "shows chosen resource", %{conn: conn} do
    cart = Repo.insert! %Cart{}
    conn = get conn, cart_path(conn, :show, cart)
    assert html_response(conn, 200) =~ "Show cart"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, cart_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    cart = Repo.insert! %Cart{}
    conn = get conn, cart_path(conn, :edit, cart)
    assert html_response(conn, 200) =~ "Edit cart"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    cart = Repo.insert! %Cart{}
    conn = put conn, cart_path(conn, :update, cart), cart: @valid_attrs
    assert redirected_to(conn) == cart_path(conn, :show, cart)
    assert Repo.get_by(Cart, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    cart = Repo.insert! %Cart{}
    conn = put conn, cart_path(conn, :update, cart), cart: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit cart"
  end

  test "deletes chosen resource", %{conn: conn} do
    cart = Repo.insert! %Cart{}
    conn = delete conn, cart_path(conn, :delete, cart)
    assert redirected_to(conn) == cart_path(conn, :index)
    refute Repo.get(Cart, cart.id)
  end
end
