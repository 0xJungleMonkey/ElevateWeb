require 'rubygems'
require 'twilio-ruby'

class Elevator < ApplicationRecord
    belongs_to :column
    
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