class InterventionsController < InheritedResources::Base
  require 'byebug'
  protect_from_forgery
  before_action :authenticate_user!
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_datetime, :end_datetime, :result, :report, :status)
    end
    skip_before_action :verify_authenticity_token

    def create
     
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
         # Your freshdesk domain
      freshdesk_domain = 'https://meowmeowco.freshdesk.com/api/v2/tickets'
      
      # It could be either your user name or api_key.
      api_key = Figaro.env.freshdesk_api_key
      # If you have given api_key, then it should be x. If you have given user name, it should be password
      password_or_x = 'X'
        
      #attachments should be of the form array of Hash with files mapped to the key 'resource'.
      quote_payload = { status: 2,
                          priority: 1,
                          type: "Incident",
                          email: "xinqidavis@gmail.com",
                          subject: "Interventions report",
                          description: "The requester #{intervention.author} reported an intervention request. Details are as follows:
                          Building ID: #{intervention.building_id};
                          Battery ID: #{intervention.battery_id};
                          Column ID: #{intervention.column_id};
                          Elevator ID: #{intervention.elevator_id};
                          Employee to be assigned to the task: #{intervention.employee_id};
                          Description of the request for intervention: #{intervention.report}",

        }.to_json
      # quote_payload = {status: 2, priority: 1, type: "Question", email: "email@stuff.com", description: "Hello", subject: "yeeee",}.to_json
                          
                          
          site = RestClient::Resource.new(freshdesk_domain, api_key, password_or_x)
          
          begin
              response = site.post(quote_payload, :content_type=>"application/json")
              puts "response_code: #{response.code} \n Location Header: #{response.headers[:Location]} \n response_body: #{response.body} \n"
          rescue RestClient::Exception => exception
              puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
              puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
        puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
    end
    ##################################################################
    # FreshDesk END
    ##################################################################
    redirect_to('/interventions')
    end
        # intervention.author = current_user
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
# end
