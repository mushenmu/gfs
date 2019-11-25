require 'test_helper'

class GasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ga = gas(:one)
  end

  test "should get index" do
    get gas_url
    assert_response :success
  end

  test "should get new" do
    get new_ga_url
    assert_response :success
  end

  test "should create ga" do
    assert_difference('Ga.count') do
      post gas_url, params: { ga: { state: @ga.state, url: @ga.url } }
    end

    assert_redirected_to ga_url(Ga.last)
  end

  test "should show ga" do
    get ga_url(@ga)
    assert_response :success
  end

  test "should get edit" do
    get edit_ga_url(@ga)
    assert_response :success
  end

  test "should update ga" do
    patch ga_url(@ga), params: { ga: { state: @ga.state, url: @ga.url } }
    assert_redirected_to ga_url(@ga)
  end

  test "should destroy ga" do
    assert_difference('Ga.count', -1) do
      delete ga_url(@ga)
    end

    assert_redirected_to gas_url
  end
end
