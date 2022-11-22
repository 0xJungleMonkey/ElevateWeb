class InterventionsController < InheritedResources::Base
  require 'byebug'
  protect_from_forgery
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_datetime, :end_datetime, :result, :report, :status)
    end
    def create
      intervention= Intervention.create!(
        # raise Foorbar
        building_id: params[:building_id],
        customer_id: params[:customer_id],
        
      )
    end
    def get_buildings_by_customer_id
      # byebug
      @buildings = Building.where("customer_id = ?", params[:customer_id])
      respond_to do |format|
        # console
        format.json { render :json => @buildings }
        
      end
      # console
    end
    
    
end
