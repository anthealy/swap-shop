require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @type = Type.create(name: "LP")
    
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
     get type_path(@type)
    assert_response :success
    
  end
end
