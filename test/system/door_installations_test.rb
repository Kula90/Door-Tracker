require "application_system_test_case"

class DoorInstallationsTest < ApplicationSystemTestCase
  setup do
    @door_installation = door_installations(:one)
  end

  test "visiting the index" do
    visit door_installations_url
    assert_selector "h1", text: "Door installations"
  end

  test "should create door installation" do
    visit door_installations_url
    click_on "New door installation"

    fill_in "Construction site", with: @door_installation.construction_site_id
    fill_in "Floor", with: @door_installation.floor
    fill_in "Installed at", with: @door_installation.installed_at
    click_on "Create Door installation"

    assert_text "Door installation was successfully created"
    click_on "Back"
  end

  test "should update Door installation" do
    visit door_installation_url(@door_installation)
    click_on "Edit this door installation", match: :first

    fill_in "Construction site", with: @door_installation.construction_site_id
    fill_in "Floor", with: @door_installation.floor
    fill_in "Installed at", with: @door_installation.installed_at
    click_on "Update Door installation"

    assert_text "Door installation was successfully updated"
    click_on "Back"
  end

  test "should destroy Door installation" do
    visit door_installation_url(@door_installation)
    click_on "Destroy this door installation", match: :first

    assert_text "Door installation was successfully destroyed"
  end
end
