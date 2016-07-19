require 'test_helper'

class ContentBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_block = content_blocks(:one)
  end

  test "should get index" do
    get content_blocks_url
    assert_response :success
  end

  test "should get new" do
    get new_content_block_url
    assert_response :success
  end

  test "should create content_block" do
    assert_difference('ContentBlock.count') do
      post content_blocks_url, params: { content_block: { content: @content_block.content, content_area: @content_block.content_area, content_type: @content_block.content_type, default: @content_block.default, name: @content_block.name, presentation: @content_block.presentation } }
    end

    assert_redirected_to content_block_url(ContentBlock.last)
  end

  test "should show content_block" do
    get content_block_url(@content_block)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_block_url(@content_block)
    assert_response :success
  end

  test "should update content_block" do
    patch content_block_url(@content_block), params: { content_block: { content: @content_block.content, content_area: @content_block.content_area, content_type: @content_block.content_type, default: @content_block.default, name: @content_block.name, presentation: @content_block.presentation } }
    assert_redirected_to content_block_url(@content_block)
  end

  test "should destroy content_block" do
    assert_difference('ContentBlock.count', -1) do
      delete content_block_url(@content_block)
    end

    assert_redirected_to content_blocks_url
  end
end
