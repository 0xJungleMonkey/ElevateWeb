
require 'rubygems'
require 'twilio-ruby'
class Elevator < ApplicationRecord
  include ActiveModel::Dirty

  belongs_to :column

  require 'slack-notifier'

  oldstatus = ''
  before_update do
    oldstatus = self.Status_was
  end

  after_update do


    if oldstatus != self.Status


      notifier = Slack::Notifier.new ENV["slackwebhook"]
      notifier.ping "The Elevator #{id} with Serial Number #{self.SerialNumber} changed status from #{oldstatus} to #{self.Status}"
    end
  end

  
 after_update :send_sms
   
    
# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
def send_sms
    
    @client = Twilio::REST::Client.new(Figaro.env.account_sid, Figaro.env.auth_token)

    message = @client.messages.create(
     body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
     from: '+19804009897',
     to: '+17278559151'
    )

    puts message.sid
end
    

end
