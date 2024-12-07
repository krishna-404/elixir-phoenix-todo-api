defmodule Todos.TodoList.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :title, :done]}

  schema "todos" do
    field :title, :string
    field :done, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  def changeset(todo, attrs) do
    todo|> cast(attrs, [:title, :done])
    |> validate_required([:title])
    |> validate_length(:title, min: 5)
  end
end
