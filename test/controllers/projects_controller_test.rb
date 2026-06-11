require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @organization = organizations(:one)
    @user = users(:one)

    sign_in @user
  end

  test "should get index" do
    get projects_url

    assert_response :success
  end

  test "should get new" do
    get new_project_url

    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count", 1) do
      post projects_url,
           params: {
             project: {
               name: "AI Sprint Planner",
               description: "AI powered sprint planning project",
               organization_id: @organization.id
             }
           }
    end

    assert_redirected_to projects_url
  end

  test "should show project" do
    get project_url(@project)

    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)

    assert_response :success
  end

  test "should update project" do
    patch project_url(@project),
          params: {
            project: {
              name: "Updated Project"
            }
          }

    assert_redirected_to projects_url

    @project.reload

    assert_equal "Updated Project", @project.name
  end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
