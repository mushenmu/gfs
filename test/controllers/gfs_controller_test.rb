require 'test_helper'

class GfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gf = gfs(:one)
  end

  test "should get index" do
    get gfs_url
    assert_response :success
  end

  test "should get new" do
    get new_gf_url
    assert_response :success
  end

  test "should create gf" do
    assert_difference('Gf.count') do
      post gfs_url, params: { gf: { state: @gf.state, url: @gf.url } }
    end

    assert_redirected_to gf_url(Gf.last)
  end

  test "should show gf" do
    get gf_url(@gf)
    assert_response :success
  end

  test "should get edit" do
    get edit_gf_url(@gf)
    assert_response :success
  end

  test "should update gf" do
    patch gf_url(@gf), params: { gf: { state: @gf.state, url: @gf.url } }
    assert_redirected_to gf_url(@gf)
  end

  test "should destroy gf" do
    assert_difference('Gf.count', -1) do
      delete gf_url(@gf)
    end

    assert_redirected_to gfs_url
  end
end
