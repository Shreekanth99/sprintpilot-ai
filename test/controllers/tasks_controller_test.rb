require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @user = users(:one)

    sign_in @user
  end

  test "should get index" do
    get tasks_url

    assert_response :success
  end

  test "should get new" do
    get new_task_url

    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count", 1) do
      post tasks_url,
           params: {
             task: {
               title: "New Task",
               description: "New Task Description",
               status: :todo,
               story_id: stories(:one).id,
               assignee_id: users(:one).id
             }
           }
    end

    assert_redirected_to tasks_url
  end

  test "should show task" do
    get task_url(@task)

    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)

    assert_response :success
  end

  test "should update task" do
    patch task_url(@task),
          params: {
            task: {
              title: "Updated Task"
            }
          }

    assert_redirected_to tasks_url

    @task.reload

    assert_equal "Updated Task",
                 @task.title
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
