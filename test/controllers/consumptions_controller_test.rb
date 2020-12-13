require 'test_helper'

class ConsumptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consumptions_index_url
    assert_response :success
  end

  test "should get new" do
    get consumptions_new_url
    assert_response :success
  end

  test "should get view" do
    get consumptions_view_url
    assert_response :success
  end

end
