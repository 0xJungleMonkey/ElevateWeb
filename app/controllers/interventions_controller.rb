class InterventionsController < InheritedResources::Base

  private

    def intervention_params
      params.require(:intervention).permit(:Author, :CustomerID, :BuildingID, :BatteryID, :ColumnID, :ElevatorID, :EmployeeID, :StartDatetime, :Enddatetime, :Result, :Report, :Status)
    end

end
