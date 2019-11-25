require "application_system_test_case"

class GasTest < ApplicationSystemTestCase
  setup do
    @ga = gas(:one)
  end

  test "visiting the index" do
    visit gas_url
    assert_selector "h1", text: "Gas"
  end

  test "creating a Ga" do
    visit gas_url
    click_on "New Ga"

    fill_in "State", with: @ga.state
    fill_in "Url", with: @ga.url
    click_on "Create Ga"

    assert_text "Ga was successfully created"
    click_on "Back"
  end

  test "updating a Ga" do
    visit gas_url
    click_on "Edit", match: :first

    fill_in "State", with: @ga.state
    fill_in "Url", with: @ga.url
    click_on "Update Ga"

    assert_text "Ga was successfully updated"
    click_on "Back"
  end

  test "destroying a Ga" do
    visit gas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ga was successfully destroyed"
  end
end
