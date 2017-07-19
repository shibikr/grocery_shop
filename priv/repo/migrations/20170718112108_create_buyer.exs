defmodule Groceryshop.Repo.Migrations.CreateBuyer do
  use Ecto.Migration

  def change do
    create table(:buyers) do
      add :name, :string, null: false
      add :email, :string, null: false

      timestamps()
    end

    create unique_index(:buyers, ["lower(email)"])
    create constraint(:buyers, "email_should_be_valid", check: "email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'")
    create constraint(:buyers, "name_cannot_be_empty", check: "char_length(name) >= 1")

  end
end
