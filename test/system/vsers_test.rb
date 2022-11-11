require "application_system_test_case"

class VsersTest < ApplicationSystemTestCase
  setup do
    @vser = vsers(:one)
  end

  test "visiting the index" do
    visit vsers_url
    assert_selector "h1", text: "Vsers"
  end

  test "creating a Vser" do
    visit vsers_url
    click_on "New Vser"

    fill_in "Email", with: @vser.email
    fill_in "Login", with: @vser.login
    fill_in "Name", with: @vser.name
    click_on "Create Vser"

    assert_text "Vser was successfully created"
    click_on "Back"
  end

  test "updating a Vser" do
    visit vsers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @vser.email
    fill_in "Login", with: @vser.login
    fill_in "Name", with: @vser.name
    click_on "Update Vser"

    assert_text "Vser was successfully updated"
    click_on "Back"
  end

  test "destroying a Vser" do
    visit vsers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vser was successfully destroyed"
  end
end
