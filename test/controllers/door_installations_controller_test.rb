# test/controllers/door_installations_controller_test.rb
require 'test_helper'

class DoorInstallationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @construction_site = construction_sites(:one)
    @door_installation = door_installations(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should create door installation" do
    assert_difference('DoorInstallation.count') do
      post construction_site_door_installations_url(@construction_site), params: { door_installation: { number_of_doors: 3, installation_date: '2024-07-18', installation_time: '14:00', floor: 1, block: 'A' } }
    end

    assert_redirected_to construction_site_door_installation_url(@construction_site, DoorInstallation.last)
  end

  test "should update door installation" do
    patch construction_site_door_installation_url(@construction_site, @door_installation), params: { door_installation: { number_of_doors: @door_installation.number_of_doors, installation_date: @door_installation.installation_date, installation_time: @door_installation.installation_time, floor: @door_installation.floor, block: @door_installation.block } }
    assert_redirected_to construction_site_door_installation_url(@construction_site, @door_installation)
  end
end
