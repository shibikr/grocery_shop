defmodule Groceryshop.CartTest do
  use Groceryshop.ModelCase

  alias Groceryshop.Cart

  @valid_attrs %{buyer_id: 1234}
  @invalid_attrs %{}

  test "changeset with valid buyer" do
    changeset = Cart.changeset(%Cart{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid buyer" do
    changeset = Cart.changeset(%Cart{}, @invalid_attrs)
    refute changeset.valid?
  end
end
