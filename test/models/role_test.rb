require "test_helper"

class RoleTest < ActiveSupport::TestCase
  test "all returns Role objects for each defined role" do
    roles = Role.all
    
    assert_equal Role::TYPES.length, roles.length
    
    Role::TYPES.each do |role_type|
      role = roles.find { |r| r.id == role_type }
      assert_not_nil role
      assert_instance_of Role, role
    end
  end

  test "for_select returns formatted roles for dropdown" do
    select_options = Role.for_select
    
    assert_equal Role::TYPES.length, select_options.length
    
    Role::TYPES.each do |role_type|
      option = select_options.find { |o| o[:id] == role_type }
      assert_not_nil option
      assert_equal role_type.titleize, option[:name]
      
      case role_type
      when "software_engineer"
        assert_equal "Software Engineer", option[:name]
      when "site_reliability_engineer"
        assert_equal "Site Reliability Engineer", option[:name]
      when "engineering_manager"
        assert_equal "Engineering Manager", option[:name]
      end
    end
  end
end 