defmodule Groceryshop.Repo.Migrations.CreateCartDetail do
  use Ecto.Migration

  def change do
    create table(:cart_details) do
      add :quantity, :integer
      add :cart_id, references(:carts, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)
#      TODO: [Prasun] Check on on delete

      timestamps()
    end
    create index(:cart_details, [:cart_id])
    create index(:cart_details, [:product_id])

  end
end
