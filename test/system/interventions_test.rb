require "application_system_test_case"

class InterventionsTest < ApplicationSystemTestCase
  setup do
    @intervention = interventions(:one)
  end

  test "visiting the index" do
    visit interventions_url
    assert_selector "h1", text: "Interventions"
  end

  test "creating a Intervention" do
    visit interventions_url
    click_on "New Intervention"

    fill_in "Author", with: @intervention.Author
    fill_in "Batteryid", with: @intervention.BatteryID
    fill_in "Buildingid", with: @intervention.BuildingID
    fill_in "Columnid", with: @intervention.ColumnID
    fill_in "Customerid", with: @intervention.CustomerID
    fill_in "Elevatorid", with: @intervention.ElevatorID
    fill_in "Employeeid", with: @intervention.EmployeeID
    fill_in "Enddatetime", with: @intervention.Enddatetime
    fill_in "Report", with: @intervention.Report
    fill_in "Result", with: @intervention.Result
    fill_in "Startdatetime", with: @intervention.StartDatetime
    fill_in "Status", with: @intervention.Status
    click_on "Create Intervention"

    assert_text "Intervention was successfully created"
    click_on "Back"
  end

  test "updating a Intervention" do
    visit interventions_url
    click_on "Edit", match: :first

    fill_in "Author", with: @intervention.Author
    fill_in "Batteryid", with: @intervention.BatteryID
    fill_in "Buildingid", with: @intervention.BuildingID
    fill_in "Columnid", with: @intervention.ColumnID
    fill_in "Customerid", with: @intervention.CustomerID
    fill_in "Elevatorid", with: @intervention.ElevatorID
    fill_in "Employeeid", with: @intervention.EmployeeID
    fill_in "Enddatetime", with: @intervention.Enddatetime
    fill_in "Report", with: @intervention.Report
    fill_in "Result", with: @intervention.Result
    fill_in "Startdatetime", with: @intervention.StartDatetime
    fill_in "Status", with: @intervention.Status
    click_on "Update Intervention"

    assert_text "Intervention was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention" do
    visit interventions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention was successfully destroyed"
  end
end
