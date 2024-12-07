
defmodule Todos.TodoListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todos.TodoList` context.
  """
  @defaults %{
    title: "Walk the dog",
    done: false
  }

  def todo_fixture(attrs \\%{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(@defaults)
      |> Todos.TodoList.create_todo()

    todo
  end
end
