defmodule TodosWeb.TodoController do
  use TodosWeb, :controller

  alias Todos.TodoList

  def index(conn, _params) do
    todos = TodoList.list_todos()
    render(conn, :index, todos: todos)
  end
end
