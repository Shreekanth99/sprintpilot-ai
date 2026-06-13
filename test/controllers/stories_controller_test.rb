require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:one)
    @user = users(:one)

    sign_in @user
  end

  test "should get index" do
    get stories_url

    assert_response :success
  end

  test "should get new" do
    get new_story_url

    assert_response :success
  end

  test "should create story" do
    assert_difference("Story.count", 1) do
      post stories_url,
           params: {
             story: {
               title: "New Story",
               description: "New Story Description",
               story_points: 8,
               status: :todo,
               epic_id: epics(:one).id,
               sprint_id: sprints(:one).id
             }
           }
    end

    assert_redirected_to stories_url
  end

  test "should show story" do
    get story_url(@story)

    assert_response :success
  end

  test "should get edit" do
    get edit_story_url(@story)

    assert_response :success
  end

  test "should update story" do
    patch story_url(@story),
          params: {
            story: {
              title: "Updated Story"
            }
          }

    assert_redirected_to stories_url

    @story.reload

    assert_equal "Updated Story",
                 @story.title
  end

  test "should destroy story" do
    assert_difference("Story.count", -1) do
      delete story_url(@story)
    end

    assert_redirected_to stories_url
  end
end
