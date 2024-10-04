# test/controllers/floors_controller_test.rb
require 'test_helper'

class FloorsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @floor = floors(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get show" do
    get construction_site_floor_url(@floor.construction_site, @floor)
    assert_response :success
  end
end
