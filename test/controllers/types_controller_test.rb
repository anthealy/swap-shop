require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @type = Type.create(name: "LP")
    @user = User.create(username: "admin2", email: "admin2@admin.com", password: "password", admin: true)
    
  end
  
  test "should get types index" do
    get types_path
    assert_response :success
  end
  
  test "should get new" do
    get new_type_path
    assert_response :success
  end
  
  test "should get show" do 
     session sign_in_as(@user, "password")
     get type_path(@type)
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Type.count' do
      post types_path, params: {type: {name: "LP"}}
    end
    assert_redirected_to types_path
  end
  
  
end
