# frozen_string_literal: true
require 'rubygems'
require 'rest_client'
require 'json'

class QuotesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  protect_from_forgery 
  def create

    @quote = Quote.create!(
      name: params[:name],
      company_name: params[:businessname],
      email: params[:email],
      phone: params[:phone],
      department: params[:department],
      project_description: params[:project_description],
      project_name: params[:project_name],
      building_type: params[:building_type],
      service_quality: params[:service_quality],
      number_of_apartments: params[:number_of_apartments],
      number_of_floors: params[:number_of_floors],
      number_of_businesses: params[:number_of_businesses],
      number_of_basements: params[:number_of_basements],
      number_of_parking: params[:number_of_parking],
      number_of_cages: params[:number_of_cages],
      number_of_occupants: params[:number_of_occupants],
      number_of_hours: params[:number_of_hours],
      number_of_elevators_needed: params[:number_of_elevators_needed],
      price_per_unit: params[:price_per_unit],
      elevator_price: params[:elevator_price],
      installation_fee: params[:installation_fee],
      final_price: params[:final_price],

    )
    
     ##################################################################
    # FreshDesk
    ##################################################################
    
    # Your freshdesk domain
    freshdesk_domain = 'https://codeboxx.freshdesk.com/api/v2/tickets'

    # It could be either your user name or api_key.
    api_key = ENV["freshdesk_api_key"]
    
    # If you have given api_key, then it should be x. If you have given user name, it should be password
    password_or_x = 'X'

    # if @quote.name == nil
    # @quote.name = "n/a"
    # end
    # if @quote.company_name == nil
    # @quote.company_name = "n/a"
    # end
    # if @quote.email == nil
    # @quote.email = "n/a"
    # end
    # if @quote.phone == nil
    # @quote.phone = "n/a"
    # end
    # if @quote.department == nil
    # @quote.department = "n/a"
    # end
    # if @quote.project_name == nil
    #   @quote.project_name = "n/a"
    # end
    # if @quote.project_description == nil
    # @quote.project_description = "n/a"
    # end
    # if @quote.building_type == nil
    # @quote.building_type = "n/a"
    # end
    # if @quote.service_quality == nil
    # @quote.service_quality = "n/a"
    # end

      
    #attachments should be of the form array of Hash with files mapped to the key 'resource'.
    quote_payload = { status: 2,
                        priority: 1,
                        type: "Feature Request",
                        email: "#{@quote.email}",
                        description: "The contact #{@quote.name} from company #{@quote.company_name} can
                        be reached at email #{@quote.email} and at phone number #{@quote.phone}. #{@quote.department} has a 
                        project named #{@quote.project_name} which would require contribution from Rocket Elevators.                                                                                     
                        Project Description: #{@quote.project_description}",
                        subject: "#{@quote.name} from company #{@quote.company_name}",
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
    redirect_to('/quotes')
  end
end