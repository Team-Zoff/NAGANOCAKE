require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

  test "should get purchase_information" do
    get orders_purchase_information_url
    assert_response :success
  end

  test "should get select" do
    get orders_select_url
    assert_response :success
  end

  test "should get confirmation" do
    get orders_confirmation_url
    assert_response :success
  end

  test "should get thanks" do
    get orders_thanks_url
    assert_response :success
  end

end
