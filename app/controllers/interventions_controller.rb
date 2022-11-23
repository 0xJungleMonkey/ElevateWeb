class InterventionsController < InheritedResources::Base
  require 'byebug'
  protect_from_forgery
  before_action :authenticate_user!
  
  # before_filter :authenticate_user!

    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_datetime, :end_datetime, :result, :report, :status)
    end
    skip_before_action :verify_authenticity_token

  #   def index    
  #     if current_user
  #       @email = current_user.email
  #       puts "*********************************************************************************************I love ruby."
  #       create()
  #     else
  #       redirect_to new_user_session_path, notice: 'You are not logged in.'
  #     end
  #  end
    def create
      # before_action :authenticate_user!
      # if log_in(current_user)
        intervention= Intervention.create!(
         
          # author: Employee.where("email = ?", current_user).first,
          author:current_user.email,
          
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
        # console
        raise_delivery_errors
        # intervention.author = current_user
    end
    # def 
  # end
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
# end
