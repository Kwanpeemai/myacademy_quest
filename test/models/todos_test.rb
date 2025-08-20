require "test_helper"

class TodoTest < ActiveSupport::TestCase
  setup do
    @todo1 = todos(:one)
    @todo2 = todos(:two)
    @todo2 = todos(:three)
  end

  test "should not save todo without title" do
    todo = Todo.new(is_complete: false)
    assert_not todo.save
  end

  test "should save todo with title" do
    todo = Todo.new(title: "My Todo", is_complete: false)
    assert todo.save
  end

  test "default scope orders by id descending" do
    todos = Todo.all.to_a
    assert_equal [ @todo3, @todo2, @todo1 ].map(&:id), todos.map(&:id)
  end
end
