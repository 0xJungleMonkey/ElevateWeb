class InterventionsController < InheritedResources::Base
  require 'byebug'
  protect_from_forgery
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_datetime, :end_datetime, :result, :report, :status)
    end
    def create
      intervention= Intervention.create!(
        result: "Incomplete",
        report: params[:report],
        status: "Pending",
        employee_id: params[:employee_id],
        elevator_id: params[:elevator_id],
        column_id: params[:column_id],
        battery_id: params[:battery_id],
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
    
    def get_batteries_by_building_id
      # byebug
      @batteries = Battery.where("building_id = ?", params[:building_id])
      respond_to do |format|
        # console
        format.json { render :json => @batteries }
        
      end
      # console
    end
    def get_columns_by_battery_id
      @columns = Column.where("battery_id = ?", params[:battery_id])
      respond_to do |format|
        # console
        format.json { render :json => @columns }
      end
      # console
    end
    def get_elevators_by_column_id
      @elevators = Elevator.where("column_id = ?", params[:column_id])
      respond_to do |format|
        # console
        format.json { render :json => @elevators }
      end
      # console
    end

end
