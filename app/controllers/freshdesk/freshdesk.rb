# require 'rubygems'
# require 'rest_client'
# require 'json'

# # Your freshdesk domain
# freshdesk_domain = 'https://codeboxx.freshdesk.com/api/v2/tickets'

# # It could be either your user name or api_key.
# api_key = ENV["freshdesk_api_key"]

# # If you have given api_key, then it should be x. If you have given user name, it should be password
# password_or_x = 'X'

# #attachments should be of the form array of Hash with files mapped to the key 'resource'.
# multipart_payload = { status: 2,
#                       priority: 1,
#                       email: 'lead.email',
#                       description: ' The contact [Full Name] from company [Company Name] can be reached at email  [E-Mail Address] and at phone number [Phone]. [Department] has a project named [Project Name] which would require contribution from Rocket Elevators.',
#                       subject: 'hello',
#                       attachments: [File.new('/path/to/your/file.png', 'rb'), File.new('/path/to/your/file2.png', 'rb')]}


# site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)

# begin
#   response = site.post(multipart_payload)
#   puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
# rescue RestClient::Exception => exception
#   puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
#   puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
#   puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
# end