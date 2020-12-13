require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @Transfer = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create Transfer" do
    assert_difference('Transfer.count') do
      post orders_url, params: { Transfer: { expire_at: @Transfer.expire_at, quantity: @Transfer.quantity, references: @Transfer.references } }
    end

    assert_redirected_to order_url(Transfer.last)
  end

  test "should show Transfer" do
    get order_url(@Transfer)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@Transfer)
    assert_response :success
  end

  test "should update Transfer" do
    patch order_url(@Transfer), params: { Transfer: { expire_at: @Transfer.expire_at, quantity: @Transfer.quantity, references: @Transfer.references } }
    assert_redirected_to order_url(@Transfer)
  end

  test "should destroy Transfer" do
    assert_difference('Transfer.count', -1) do
      delete order_url(@Transfer)
    end

    assert_redirected_to orders_url
  end
end
