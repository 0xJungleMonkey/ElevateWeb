class InterventionsController < InheritedResources::Base
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_datetime, :end_datetime, :result, :report, :status)
    end
    def get_buildings_by_customer_id
      @buildings = Building.where("customer_id = ?", params[:customer_id])
      respond_to do |format|
        format.json { render :json => @buildings }
      end
    end
end
