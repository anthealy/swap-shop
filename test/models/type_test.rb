require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  
  def setup
    @type = Type.new(name: "rock")
  end
  
  test "type should be valid" do
    assert @type.valid?
  end
  
  test "name should be present" do
    @type.name = " "
    assert_not @type.valid?
  end
  
  test "name should be unique" do
    @type.save
    type2 = Type.new(name: "rock")
    assert_not type2.valid?
  end
  
  test "name should not be too long" do
    @type.name = "a" * 26  #max length of name = 30
    assert_not @type.valid? 
  end
  
  test "name should not be too short" do
    @type.name = "a"
    assert_not @type.valid?
  end

end
