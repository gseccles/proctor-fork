require "test_helper"

class RolesControllerTest < ActionDispatch::IntegrationTest
  test "should get roles list" do
    get roles_url
    assert_response :success
    assert_equal "application/json", @response.media_type
    
    roles = JSON.parse(@response.body)
    assert_equal Role::TYPES.length, roles.length
    
    # Check format and titleization of a role
    example_role = roles.find { |r| r["id"] == "software_engineer" }
    assert_equal "Software Engineer", example_role["name"]
  end
end 