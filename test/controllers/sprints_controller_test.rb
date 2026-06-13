require "test_helper"

class SprintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sprint = sprints(:one)
    @user = users(:one)

    sign_in @user
  end

  test "should get index" do
    get sprints_url

    assert_response :success
  end

  test "should get new" do
    get new_sprint_url

    assert_response :success
  end

  test "should create sprint" do
    assert_difference("Sprint.count", 1) do
      post sprints_url,
           params: {
             sprint: {
               name: "Sprint 3",
               goal: "Implement Story CRUD",
               status: "planned",
               start_date: Date.today,
               end_date: Date.today + 14.days,
               project_id: projects(:one).id
             }
           }
    end

    assert_redirected_to sprints_url
  end

  test "should show sprint" do
    get sprint_url(@sprint)

    assert_response :success
  end

  test "should get edit" do
    get edit_sprint_url(@sprint)

    assert_response :success
  end

  test "should update sprint" do
    patch sprint_url(@sprint),
          params: {
            sprint: {
              name: "Updated Sprint"
            }
          }

    assert_redirected_to sprints_url

    @sprint.reload

    assert_equal "Updated Sprint",
                 @sprint.name
  end

  test "should destroy sprint" do
    assert_difference("Sprint.count", -1) do
      delete sprint_url(@sprint)
    end

    assert_redirected_to sprints_url
  end
end
