require 'test_helper'

class PolliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @polly = pollies(:one)
  end

  test "should get index" do
    get pollies_url
    assert_response :success
  end

  test "should get new" do
    get new_polly_url
    assert_response :success
  end

  test "should create polly" do
    assert_difference('Polly.count') do
      post pollies_url, params: { polly: {  } }
    end

    assert_redirected_to polly_url(Polly.last)
  end

  test "should show polly" do
    get polly_url(@polly)
    assert_response :success
  end

  test "should get edit" do
    get edit_polly_url(@polly)
    assert_response :success
  end

  test "should update polly" do
    patch polly_url(@polly), params: { polly: {  } }
    assert_redirected_to polly_url(@polly)
  end

  test "should destroy polly" do
    assert_difference('Polly.count', -1) do
      delete polly_url(@polly)
    end

    assert_redirected_to pollies_url
  end
end
