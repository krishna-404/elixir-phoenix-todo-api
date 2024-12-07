defmodule TodosWeb.TodoController do
  use TodosWeb, :controller

  alias Todos.TodoList

  def index(conn, _params) do
    todos = TodoList.list_todos()
    render(conn, :index, todos: todos)
  end

  def show(conn, %{"id" => id}) do
    case TodoList.get_todo(id) do
      nil -> conn |> put_status(:not_found) |> json(%{error: "Not Found"})
      todo -> json(conn, todo)
    end
  end
end
