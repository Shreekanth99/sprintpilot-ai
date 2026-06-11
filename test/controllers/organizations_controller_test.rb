require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
    @user = users(:one)

    sign_in @user
  end

  test "should get index" do
    get organizations_url

    assert_response :success
  end

  test "should get new" do
    get new_organization_url

    assert_response :success
  end

  test "should create organization" do
    assert_difference("Organization.count", 1) do
      post organizations_url,
           params: {
             organization: {
               name: "New Organization",
               slug: "new-organization"
             }
           }
    end

    assert_redirected_to organizations_url
  end

  test "should show organization" do
    get organization_url(@organization)

    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)

    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization),
          params: {
            organization: {
              name: "Updated Organization"
            }
          }

    assert_redirected_to organizations_url

    @organization.reload

    assert_equal "Updated Organization",
                 @organization.name
  end

  test "should destroy organization" do
    assert_difference("Organization.count", -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
