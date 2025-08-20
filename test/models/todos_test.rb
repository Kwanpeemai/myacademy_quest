require "test_helper"

class TodoTest < ActiveSupport::TestCase
  setup do
    @todo1 = todos(:one)
    @todo2 = todos(:two)
    @todo3 = todos(:three)
  end

  test "should not save todo without title" do
    todo = Todo.new(is_complete: false)
    assert_not todo.save
  end

  test "should save todo with title" do
    todo = Todo.new(title: "My Todo", is_complete: false)
    assert todo.save
  end

  test "default scope orders by id descending (using only 3 fixtures)" do
    ids = [ @todo1.id, @todo2.id, @todo3.id ]
    expected_ids = ids.sort
    actual_ids   = Todo.where(id: ids).pluck(:id)

    assert_equal expected_ids, actual_ids
  end
end
