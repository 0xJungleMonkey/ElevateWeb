require 'rubygems'
require 'rest_client'
require 'json'

class LeadsController < ApplicationController
    protect_from_forgery 
def create
        
    @lead = Lead.create!(
        Full_name_of_the_contact: params[:name],
        Bussiness_name: params[:businessname],
        Email: params[:email],
        Phone: params[:phone],
        Project_name: params[:department],
        Project_description: params[:projectname],
        Department_incharge: params[:projectdescription],
        Message: params[:message],
        Attached_file: params[:attachment],
        
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
        if @lead.Full_name_of_the_contact == nil
        @lead.Full_name_of_the_contact = "n/a"
        end
        if @lead.Bussiness_name == nil
        @lead.Bussiness_name = "n/a"
        end
        if @lead.Email == nil
        @lead.Email = "n/a"
        end
        if @lead.Phone == nil
        @lead.Phone = "n/a"
        end
        if @lead.Project_name == nil
        @lead.Project_name = "n/a"
        end
        if @lead.Project_description == nil
        @lead.Project_description = "n/a"
        end
        if @lead.Department_incharge == nil
        @lead.Department_incharge = "n/a"
        end
        if @lead.Message == nil
        @lead.Message = "n/a"
        end
        if @lead.Attached_file == nil
        @lead.Attached_file = "n/a"
        has_attachment = "not"
        else
        has_attachment = ""
        end
    #attachments should be of the form array of Hash with files mapped to the key 'resource'.
    multipart_payload = { status: 2,
                        priority: 1,
                        type: "Question",
                        email: "#{@lead.Email}",
                        description: "The contact #{@lead.Full_name_of_the_contact} from company #{@lead.Bussiness_name} can
                         be reached at email #{@lead.Email} and at phone number #{@lead.Phone}. #{@lead.Department_incharge} has a 
                         project named #{@lead.Project_name} which would require contribution from Rocket Elevators.                                                                                     
                         Project Description: #{@lead.Project_description}",
                        subject: "#{@lead.Full_name_of_the_contact} from company #{@lead.Bussiness_name}",
                        # attachments: [File.new('/path/to/your/file.png', 'rb'), File.new('/path/to/your/file2.png', 'rb')]
    }.to_json
                        
                        
    site = RestClient::Resource.new(freshdesk_domain, api_key, password_or_x)

    begin
        response = site.post(multipart_payload, :content_type=>"application/json")
        puts "response_code: #{response.code} \n Location Header: #{response.headers[:Location]} \n response_body: #{response.body} \n"
    rescue RestClient::Exception => exception
        puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
        puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
        puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
    end
    ##################################################################
    # FreshDesk END
    ##################################################################
    
end

def leads_params
    params.permit(:Full_name_of_the_contact, :Bussiness_name, 
        :Email, :Phone, :Project_name, :Project_description, :Department_incharge,
        :Message, :Attached_file
    )
end

end
