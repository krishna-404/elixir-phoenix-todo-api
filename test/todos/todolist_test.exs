defmodule Todos.TodoListTest do
  use Todos.DataCase
  alias Todos.TodoList

  describe "todos" do
    import Todos.TodoListFixtures

    test "list_todos/0 return all todos" do
      todo = todo_fixture()
      assert TodoList.list_todos() == [todo]
    end

    test "create_todo/1 with invalid data returns error changeset" do
      invalid_attrs = %{done: nil, title: nil}
      assert {:error, %Ecto.Changeset{}} = TodoList.create_todo(invalid_attrs)
    end
  end

end
