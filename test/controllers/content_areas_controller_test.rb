require 'test_helper'

class ContentAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_area = content_areas(:one)
  end

  test "should get index" do
    get content_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_content_area_url
    assert_response :success
  end

  test "should create content_area" do
    assert_difference('ContentArea.count') do
      post content_areas_url, params: { content_area: { content_type: @content_area.content_type, height: @content_area.height, name: @content_area.name, template: @content_area.template, width: @content_area.width } }
    end

    assert_redirected_to content_area_url(ContentArea.last)
  end

  test "should show content_area" do
    get content_area_url(@content_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_area_url(@content_area)
    assert_response :success
  end

  test "should update content_area" do
    patch content_area_url(@content_area), params: { content_area: { content_type: @content_area.content_type, height: @content_area.height, name: @content_area.name, template: @content_area.template, width: @content_area.width } }
    assert_redirected_to content_area_url(@content_area)
  end

  test "should destroy content_area" do
    assert_difference('ContentArea.count', -1) do
      delete content_area_url(@content_area)
    end

    assert_redirected_to content_areas_url
  end
end
