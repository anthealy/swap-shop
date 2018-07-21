require 'test_helper'

class CreateTypeTest < ActionDispatch::IntegrationTest
  
  def setup
   @user = User.create(username: "admin2", email: "admin2@admin.com", password: "password", admin: true)
  end 
  
  
  test "get new type form and create type" do
    sign_in_as(@user, "password") 
    get new_type_path
    assert_template 'types/new'
    assert_difference 'Type.count', 1 do
      post types_path, params:{type:{name: "LP"}} 
      follow_redirect!
      end
      assert_template 'types/index'
      assert_match "LP", response.body
  end
  
   test "invalid type submission results in failure" do
     sign_in_as(@user, "password")
     get new_type_path
     assert_template 'types/new'
     assert_no_difference 'Type.count' do
       post types_path, params:{type:{name: " "}} 
       
     end
    assert_template 'types/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
end 
