class Lead < ApplicationRecord

  # after_create :sendAttachedFile
  # require 'dropbox_api'

  # has_one_attached :image
  # validate :acceptable_image
  #
  # def acceptable_image
  #   return unless image.attached?
  #
  #   if image.byte_size > 1.megabyte
  #     image_size = (image.byte_size / 1_000_000.0).round(2)
  #     errors.add(:image, "size #{image_size} MB exceeds 1 MB limit")
  #   end
  #
  #   acceptable_types = ['image/jpeg', 'image/jpg', 'image/png']
  #   errors.add(:image, 'must be a JPEG or PNG') unless acceptable_types.include?(image.content_type)
  # end
  #
  #
  # # define the after_save action to remove an image
  # def remove_attached_image?
  #   remove_attached_image == '1'
  # end
  #
  # def purge_attached_image
  #   image.purge_later
  # end
  #
  # attr_accessor :remove_attached_image
  # after_save :purge_attached_image, if: :remove_attached_image?
  # def sendAttachedFile
  #   unless self.Attached_file.nil?
  #     # varNameForPath = '/client_folder'
  #     client = DropboxApi::Client.new(ENV["OAuthToken"])
  #     begin
  #       #   #   #   client.upload("/#{self.Full_name_of_the_contact}/file", self.Attached_file)
  #       #   #
  #       #   #   begin
  #       client.create_folder("/DoomSlayer")
  #       file_content = IO.read(self.Attached_file)
  #       #   #
  #       #   #   # test = Lead.first
  #       #   #   # binary = test.Attached_file
  #       #   #   #
  #       #   #   # client = Dropbox...new...
  #       #   #   #   client.upload(somePath, binary)
  #       #   #
  #       # client.upload("/DoomSlayer/duck", self.Attached_file)
  #       client.upload("/DoomSlayer/duck", file_content)
  #     end
  #   end
  # end

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
