defmodule TodosWeb.TodoController do
  use TodosWeb, :controller

  alias Todos.TodoList

  action_fallback TodosWeb.FallbackController

  def index(conn, _params) do
    todos = TodoList.list_todos()
    render(conn, :index, todos: todos)
  end

  def create(conn, %{"todo" => todo_params}) do
    with {:ok, todo} <- TodoList.create_todo(todo_params) do
      conn |> put_status(:created) |> put_resp_header("Location", ~p"/api/todos/#{todo.id}") |> json(todo)
    end

  end

  def show(conn, %{"id" => id}) do
    case TodoList.get_todo(id) do
      nil -> conn |> put_status(:not_found) |> json(%{error: "Not Found"})
      todo -> json(conn, todo)
    end
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = TodoList.get_todo(id)

    with {:ok, %TodoList.Todo{} = todo} <- TodoList.update_todo(todo, todo_params) do
      render(conn, :show, todo: todo)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = TodoList.get_todo(id)

    with {:ok, %TodoList.Todo{} = _} <- TodoList.delete_todo(todo) do
      send_resp(conn, :no_content, "")
    end
  end
end
