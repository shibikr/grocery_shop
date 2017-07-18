defmodule Groceryshop.Buyer do
  use Groceryshop.Web, :model

  schema "buyers" do
    field :name, :string
    field :email, :string

    timestamps()
  end
@required_params [:name, :email]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_params)
    |> validate_required([:name, :email])
    |> validate_length(:name, min: 1)
    |> validate_format(:email, ~r/@/)
  end
end
