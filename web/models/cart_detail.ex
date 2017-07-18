defmodule Groceryshop.CartDetail do
  use Groceryshop.Web, :model

  schema "cart_details" do
    field :quantity, :integer
    belongs_to :cart, Groceryshop.Cart
    belongs_to :product, Groceryshop.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:quantity])
    |> validate_required([:quantity])
  end
end
