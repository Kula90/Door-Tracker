# test/controllers/construction_sites_controller_test.rb
require 'test_helper'

class ConstructionSitesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @construction_site = construction_sites(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should create construction site" do
    assert_difference('ConstructionSite.count') do
      post construction_sites_url, params: { construction_site: { name: 'New Site', address: '123 New St', floors: 2 } }
    end

    assert_redirected_to construction_site_url(ConstructionSite.last)
  end

  test "should update construction site" do
    patch construction_site_url(@construction_site), params: { construction_site: { name: @construction_site.name, address: @construction_site.address, floors: @construction_site.floors } }
    assert_redirected_to construction_site_url(@construction_site)
  end
end
