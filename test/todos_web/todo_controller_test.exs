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
end
