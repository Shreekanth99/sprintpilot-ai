require "test_helper"

class EpicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epic = epics(:one)
    @user = users(:one)

    sign_in @user
  end

  test "should get index" do
    get epics_url

    assert_response :success
  end

  test "should get new" do
    get new_epic_url

    assert_response :success
  end

  test "should create epic" do
    assert_difference("Epic.count", 1) do
      post epics_url,
           params: {
             epic: {
               title: "New Epic",
               description: "Epic Description",
               project_id: projects(:one).id
             }
           }
    end

    assert_redirected_to epics_url
  end

  test "should show epic" do
    get epic_url(@epic)

    assert_response :success
  end

  test "should get edit" do
    get edit_epic_url(@epic)

    assert_response :success
  end

  test "should update epic" do
    patch epic_url(@epic),
          params: {
            epic: {
              title: "Updated Epic"
            }
          }

    assert_redirected_to epics_url

    @epic.reload

    assert_equal "Updated Epic",
                 @epic.title
  end

  test "should destroy epic" do
    assert_difference("Epic.count", -1) do
      delete epic_url(@epic)
    end

    assert_redirected_to epics_url
  end
end