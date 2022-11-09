require 'test_helper'

class VsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vser = vsers(:one)
  end

  test "should get index" do
    get vsers_url
    assert_response :success
  end

  test "should get new" do
    get new_vser_url
    assert_response :success
  end

  test "should create vser" do
    assert_difference('Vser.count') do
      post vsers_url, params: { vser: { email: @vser.email, login: @vser.login, name: @vser.name } }
    end

    assert_redirected_to vser_url(Vser.last)
  end

  test "should show vser" do
    get vser_url(@vser)
    assert_response :success
  end

  test "should get edit" do
    get edit_vser_url(@vser)
    assert_response :success
  end

  test "should update vser" do
    patch vser_url(@vser), params: { vser: { email: @vser.email, login: @vser.login, name: @vser.name } }
    assert_redirected_to vser_url(@vser)
  end

  test "should destroy vser" do
    assert_difference('Vser.count', -1) do
      delete vser_url(@vser)
    end

    assert_redirected_to vsers_url
  end
end
