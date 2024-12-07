defmodule TodosWeb.TodoControllerTest do
  use TodosWeb.ConnCase
  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "list all todos", %{conn: conn} do
      conn = get(conn, ~p"/api/todos")
      assert json_response(conn, 200) == []
    end
  end

  describe "get error on non-existent todo" do
    test "renders 404", %{conn: conn} do
      conn = get(conn, ~p"/api/todos/1337")
      assert json_response(conn, 404) == %{"error" => "Not Found"}
    end
  end

  describe "index with setup" do
    import Todos.TodoListFixtures
    setup [:setup_todo]

    test "list all todos (setup)", %{conn: conn, todo: todo} do
      conn = get(conn, ~p"/api/todos")
      expected_todo = %{"id" => todo.id, "title" => todo.title, "done" => todo.done}
      assert [^expected_todo] = json_response(conn, 200)
    end

    defp setup_todo(_) do
      todo = todo_fixture()
      %{todo: todo}
    end
  end

end
