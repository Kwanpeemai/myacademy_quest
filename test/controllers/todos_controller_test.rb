require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end


  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { is_complete: @todo.is_complete, title: @todo.title } }
    end

    assert_redirected_to todos_url
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { is_complete: @todo.is_complete, title: @todo.title } }
    assert_redirected_to todos_url
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end
