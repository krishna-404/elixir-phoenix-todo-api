defmodule Todos.TodoList.Todo do
  use Ecto.Schema

  schema "todos" do
    field :title, :string
    field :done, :boolean, default: false

    timestamps(type: :utc_datetime)
  end
end
