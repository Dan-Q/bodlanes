require 'test_helper'

class MediaFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media_file = media_files(:one)
  end

  test "should get index" do
    get media_files_url
    assert_response :success
  end

  test "should get new" do
    get new_media_file_url
    assert_response :success
  end

  test "should create media_file" do
    assert_difference('MediaFile.count') do
      post media_files_url, params: { media_file: { file: @media_file.file, presentation_id: @media_file.presentation_id } }
    end

    assert_redirected_to media_file_url(MediaFile.last)
  end

  test "should show media_file" do
    get media_file_url(@media_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_media_file_url(@media_file)
    assert_response :success
  end

  test "should update media_file" do
    patch media_file_url(@media_file), params: { media_file: { file: @media_file.file, presentation_id: @media_file.presentation_id } }
    assert_redirected_to media_file_url(@media_file)
  end

  test "should destroy media_file" do
    assert_difference('MediaFile.count', -1) do
      delete media_file_url(@media_file)
    end

    assert_redirected_to media_files_url
  end
end
