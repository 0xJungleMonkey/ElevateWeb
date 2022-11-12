require 'rubygems'
require 'rest_client'
require 'json'

class LeadsController < ApplicationController

  protect_from_forgery
  # skip_before_action :verify_authenticity_token
  def create

    lead = Lead.create!(
      Full_name_of_the_contact: params[:name],
      Bussiness_name: params[:bussinessname],
      Email: params[:email],
      Phone: params[:phone],
      Project_name: params[:department],
      Project_description: params[:projectname],
      Department_incharge: params[:projectdescription],
      Message: params[:message],
      Attached_file: params[:Attached_file]
    )

  end

  # private
  #
  # def image?
  #   params[:Attached_file]&.read
  # end

require 'sendgrid-ruby'
include SendGrid
    def create
       @lead = Lead.create!(
            Full_name_of_the_contact: params[:name],
            Bussiness_name: params[:bussinessname],
            email: params[:email],
            Phone: params[:phone],
            Project_name: params[:department],
            Project_description: params[:projectname],
            Department_incharge: params[:projectdescription],
            Message: params[:message],
            Attached_file: params[:attachment],
        )
        
        
        from = SendGrid::Email.new(email: 'baseballperks318@gmail.com')
        to = SendGrid::Email.new(email: "#{@lead.email}")
        subject = "Greetings #{@lead.Full_name_of_the_contact}
        We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project [Project Name].
        A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
        We’ll Talk soon
        The Rocket Team"
        content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
        mail = SendGrid::Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['sendgridAPI'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
        
        end
    
    end
        

        




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
        else
        @lead.Attached_file = "Has attachment"
        end
    #attachments should be of the form array of Hash with files mapped to the key 'resource'.
    multipart_payload = { status: 2,
                        priority: 1,
                        type: "Question",
                        email: "#{@lead.Email}",
                        description: "The contact #{@lead.Full_name_of_the_contact} from company #{@lead.Bussiness_name} can
                         be reached at email #{@lead.Email} and at phone number #{@lead.Phone}. #{@lead.Department_incharge} has a 
                         project named #{@lead.Project_name} which would require contribution from Rocket Elevators.                                                                                     
                         Project Description: #{@lead.Project_description}. Has Attached File: #{@lead.Attached_file} ",
                        subject: "#{@lead.Full_name_of_the_contact} from company #{@lead.Bussiness_name}",               
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
