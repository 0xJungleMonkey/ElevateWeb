# Rocket_Elevators_API
The 3rd week Team work on ruby on rails project -API
This project made 7 third pary API calls in the application,include Slack,Twilio,Freshdesk,sendgrid,Dropbox,Google Map and Amazon Polly. 
Outputs:
1. Twilio:
Whenever elevator status change to "Intervention", certain employee will recieve a message alert.
Done
2. Slack:
Whenever elevator status change, configured channel will ping a notification in slack.
Done
3. SendGrid:
Whenever contact form is submited, customer will recieve an email confirmation.
Done
4. Google Map:
A special page "/maps" shows all the buildings(addresses) location and relative infomations
Active admin keep giving error that google map refused to connect. So I didn't make it to show in the admin. Instead, I puts it in the route '/maps'. The rest requirements are done.

5. Freshdesk:
All the submitted quote forms and contact forms will be tracked by FreshDesk by tickets.
Done.

6. Polly:
Text to speech. Greetings to user in the admin panel 'polly'. Once Listen button is hitted, user can listen to the brief information in the company databse. Supported by amazon polly.

7. Dropbox:
Having issue about img.






