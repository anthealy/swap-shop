require 'test_helper'

class ListTypeTest < ActionDispatch::IntegrationTest
  
  def setup
    @type = Type.create(name: "LP")
    @type2 = Type.create(name: "12 inch single")
  end
  
  test "should show type listing" do
    get types_path
    assert_template 'types/index'
    assert_select "a[href=?]", type_path(@type), text: @type.name
    assert_select "a[href=?]", type_path(@type2), text: @type2.name
    
  end
  
end 
