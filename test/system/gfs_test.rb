require "application_system_test_case"

class GfsTest < ApplicationSystemTestCase
  setup do
    @gf = gfs(:one)
  end

  test "visiting the index" do
    visit gfs_url
    assert_selector "h1", text: "Gfs"
  end

  test "creating a Gf" do
    visit gfs_url
    click_on "New Gf"

    fill_in "State", with: @gf.state
    fill_in "Url", with: @gf.url
    click_on "Create Gf"

    assert_text "Gf was successfully created"
    click_on "Back"
  end

  test "updating a Gf" do
    visit gfs_url
    click_on "Edit", match: :first

    fill_in "State", with: @gf.state
    fill_in "Url", with: @gf.url
    click_on "Update Gf"

    assert_text "Gf was successfully updated"
    click_on "Back"
  end

  test "destroying a Gf" do
    visit gfs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gf was successfully destroyed"
  end
end
