defmodule Groceryshop.Repo.Migrations.CreateCart do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :buyer_id, references(:buyers, on_delete: :nothing)

      timestamps()
    end
    create index(:carts, [:buyer_id])

  end
end
