require "test_helper"

class AiAssistantControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)

    sign_in @user
  end

  test "should get index" do
    get ai_assistant_index_url

    assert_response :success
  end

  # test "should generate content" do
  #   Ai::Assistant.stub(:generate, "Generated Content") do
  #     post generate_ai_assistant_index_url,
  #          params: {
  #            prompt: "Build Login Feature",
  #            generation_type: "story"
  #          }

  #     assert_response :success
  #   end
  # end

  # test "should save story" do
  #   assert_difference("Story.count", 1) do
  #     post save_story_ai_assistant_index_url,
  #          params: {
  #            epic_id: epics(:one).id
  #          }
  #   end

  #   assert_redirected_to stories_path
  # end

  test "should save epic" do
    assert_difference("Epic.count", 1) do
      post save_epic_ai_assistant_index_url,
           params: {
             project_id: projects(:one).id
           }
    end

    assert_redirected_to epics_path
  end

  test "should save sprint" do
    assert_difference("Sprint.count", 1) do
      post save_sprint_ai_assistant_index_url,
           params: {
             project_id: projects(:one).id
           }
    end

    assert_redirected_to sprints_path
  end

  # test "should save tasks" do
  #   assert_difference("Task.count", 1) do
  #     post save_tasks_ai_assistant_index_url,
  #          params: {
  #            story_id: stories(:one).id
  #          }
  #   end

  #   assert_redirected_to tasks_path
  # end
end
