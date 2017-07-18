defmodule Groceryshop.CartDetailTest do
  use Groceryshop.ModelCase

  alias Groceryshop.CartDetail

  @valid_attrs %{quantity: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CartDetail.changeset(%CartDetail{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CartDetail.changeset(%CartDetail{}, @invalid_attrs)
    refute changeset.valid?
  end
end
