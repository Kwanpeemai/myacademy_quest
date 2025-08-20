# spec/system/todos_spec.rb
require "rails_helper"

RSpec.describe "Todos", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    Todo.delete_all
  end

  it "user can create a todo" do
    visit todos_path
    fill_in "Add a new task", with: "Learn RSpec"
    find("[data-testid='todo-submit']").click
    todo = Todo.order(:created_at).last

    expect(page).to have_selector("[data-testid='todo-#{todo.id}-title']", text: "Learn RSpec")
    expect(page).to have_selector("#todo_count", text: "1")
  end

  it "displays completed todos with line-through" do
    todo = Todo.create!(title: "Walk dog", is_complete: true)

    visit todos_path

    expect(page).to have_css("[data-testid='todo-#{todo.id}-title'].line-through", text: "Walk dog")
  end

  it "user can delete a todo" do
    todo = Todo.create!(title: "Trash me", is_complete: false)

    visit todos_path
    find("[data-testid='todo-#{todo.id}-delete']").click

    expect(page).not_to have_selector("[data-testid='todo-#{todo.id}-title']")
  end
end
