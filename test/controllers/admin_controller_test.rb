# test/controllers/admin_controller_test.rb
require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get admin_dashboard_url
    assert_response :success
  end
end
