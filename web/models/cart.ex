defmodule Groceryshop.Cart do
  use Groceryshop.Web, :model

  schema "carts" do
    belongs_to :buyer, Groceryshop.Buyer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
