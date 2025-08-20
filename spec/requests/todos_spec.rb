require "rails_helper"

RSpec.describe "Todos", type: :request do
  describe "GET /todos" do
    it "Should display 'Add a new task' on the index page" do
      get todos_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Add a new task")
    end
  end

  describe "POST /todos" do
    it "Should creates a new todo and redirects to index" do
      post todos_path, params: { todo: { title: "New Todo", is_complete: false } }

      created_todo = Todo.last
      expect(created_todo).not_to be_nil
      expect(created_todo.title).to eq("New Todo")
      expect(created_todo.is_complete).to be false

      follow_redirect!
      expect(response.body).to include("New Todo")
      end
  end

  describe "PATCH /todos/:id" do
    it "Should updates the todo status to complete" do
      todo = Todo.create!(title: "Todo", is_complete: false)

      patch todo_path(todo), params: { todo: { is_complete: true } }

      expect(todo.reload.is_complete).to be true
    end
  end

  describe "DELETE /todos/:id" do
    it "Should removes the todo from the database" do
      todo = Todo.create!(title: "Delete Todo")

      delete todo_path(todo)

      expect(Todo.find_by(id: todo.id)).to be_nil
    end
  end
end
