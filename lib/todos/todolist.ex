defmodule Todos.TodoList do
  alias Todos.Repo
  alias Todos.TodoList.Todo

  def list_todos, do: Repo.all(Todo)

  def get_todo(id), do: Repo.get(Todo, id)
end
