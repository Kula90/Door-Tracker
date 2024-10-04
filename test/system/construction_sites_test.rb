require "application_system_test_case"

class ConstructionSitesTest < ApplicationSystemTestCase
  setup do
    @construction_site = construction_sites(:one)
  end

  test "visiting the index" do
    visit construction_sites_url
    assert_selector "h1", text: "Construction sites"
  end

  test "should create construction site" do
    visit construction_sites_url
    click_on "New construction site"

    fill_in "Name", with: @construction_site.name
    click_on "Create Construction site"

    assert_text "Construction site was successfully created"
    click_on "Back"
  end

  test "should update Construction site" do
    visit construction_site_url(@construction_site)
    click_on "Edit this construction site", match: :first

    fill_in "Name", with: @construction_site.name
    click_on "Update Construction site"

    assert_text "Construction site was successfully updated"
    click_on "Back"
  end

  test "should destroy Construction site" do
    visit construction_site_url(@construction_site)
    click_on "Destroy this construction site", match: :first

    assert_text "Construction site was successfully destroyed"
  end
end
