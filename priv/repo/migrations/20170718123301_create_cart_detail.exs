defmodule Groceryshop.Repo.Migrations.CreateCartDetail do
  use Ecto.Migration

  def change do
    create table(:cart_details) do
      add :quantity, :integer
      add :cart_id, references(:carts, on_delete: :delete_all)
      add :product_id, references(:products, on_delete: :delete_all)

      timestamps()
    end
    create index(:cart_details, [:cart_id])
    create index(:cart_details, [:product_id])
    create constraint(:cart_details, "quantity_cannot_be_zero_or_negative", check: "quantity > 0")

  end
end
