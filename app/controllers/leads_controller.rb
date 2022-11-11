class LeadsController < ApplicationController
    protect_from_forgery 
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
        

        



