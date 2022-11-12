class Lead < ApplicationRecord
    # require 'sendgrid-ruby'
    # include SendGrid
    # #actually sends email after lead is created
    # after_create :send_email1
    # def send_email1
    #     send_email(self)
    # end
    # def send_email(lead)
    #     mail = Mail.new
    #     personalization0 = Personalization.new
    #     personalization0.add_to(Email.new(email: "#{lead.email}"))
    #     mail.add_personalization(personalization0)
    #     mail.from = Email.new(email: 'baseballperks318@gmail.com') #<---------- register an email with sendgrid and ad it here
    #     mail.reply_to = Email.new(email: "#{lead.email}")
    #     mail.subject = 'Thankyou for your submission'
    #     email_content = "<p> Greetings #{lead.Full_name_of_the_contact}.</p>
    #     <p>We thank you for contacting Rocket Elevators to discuss the opportunity
    #     to contribute to your project #{lead.Project_name}. A representative from our
    #     team will be in touch with you very soon. We look forward to demonstrating
    #     the value of our solutions and helping you choose the appropriate product
    #     given your requirements. </p>
    #     <p>We'll Talk soon, </p>
    #     <p>The Rocket Team </p>"
    #     mail.add_content(Content.new(type: 'text/html', value: email_content))
    #     sg = SendGrid::API.new(api_key: ENV['sendgridAPI'])
    #     response = sg.client.mail._('send').post(request_body: mail.to_json)
    #     puts "#############################################################"
    #     puts response.status_code
    #     puts response.body
    #     puts response.headers
    # end
end
