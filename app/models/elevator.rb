# require 'twilio-ruby'
# require "send_sms"
require 'rubygems'
require 'twilio-ruby'

class Elevator < ApplicationRecord
    belongs_to :column
    
    after_update :send_sms
    # private
    
# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
def send_sms
    account_sid = 'AC4ad6f8f41d920136982aa933cdc79563'
    auth_token = '5f7bc1f9a5a13f9e51095a31884414d9'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
     body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
     from: '+19804009897',
     to: '+17278559151'
    )

    puts message.sid
end
    
end
