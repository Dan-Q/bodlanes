require 'test_helper'

class ScrenTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scren_type = scren_types(:one)
  end

  test "should get index" do
    get scren_types_url
    assert_response :success
  end

  test "should get new" do
    get new_scren_type_url
    assert_response :success
  end

  test "should create scren_type" do
    assert_difference('ScrenType.count') do
      post scren_types_url, params: { scren_type: { height: @scren_type.height, name: @scren_type.name, width: @scren_type.width } }
    end

    assert_redirected_to scren_type_url(ScrenType.last)
  end

  test "should show scren_type" do
    get scren_type_url(@scren_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_scren_type_url(@scren_type)
    assert_response :success
  end

  test "should update scren_type" do
    patch scren_type_url(@scren_type), params: { scren_type: { height: @scren_type.height, name: @scren_type.name, width: @scren_type.width } }
    assert_redirected_to scren_type_url(@scren_type)
  end

  test "should destroy scren_type" do
    assert_difference('ScrenType.count', -1) do
      delete scren_type_url(@scren_type)
    end

    assert_redirected_to scren_types_url
  end
end
