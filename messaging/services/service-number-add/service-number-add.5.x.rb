# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@phone_number = @client.messaging.v1
                       .services('MG2172dd2db502e20dd981ef0d67850e1a')
                       .phone_numbers
                       .create(phone_number_sid: 'PN557ce644e5ab84fa21cc21112e22c485')

puts @phone_number.sid
