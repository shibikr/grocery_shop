defmodule Groceryshop.BuyerTest do
  use Groceryshop.ModelCase

  alias Groceryshop.Buyer

  @valid_attrs %{email: "abc@xyz.org", name: "John doe"}
  @invalid_attrs %{email: "abcattheratexyz.org", name: "John doe"}

  test "changeset with valid attributes" do
    changeset = Buyer.changeset(%Buyer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Buyer.changeset(%Buyer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
