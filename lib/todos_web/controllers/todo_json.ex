defmodule TodosWeb.TodoJSON do
  alias Todos.TodoList.Todo

  def index(%{todos: todos}) do
    todos |> Enum.map(&data/1)
  end

  def data(%Todo{} = todo) do
    %{
      id: todo.id,
      title: todo.title,
      done: todo.done
    }
  end
end
