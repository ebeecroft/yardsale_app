:Setup the YardSale App
:Windows Batch Script to be used with the GitHub GUI and YardSale App
:Created by John Wakeman Nov, 2012


cd "C:\Users\%username%\Documents\GitHub\yardsale_app"
bundle install
rake db:migrate
rake db:populate

Echo off
Echo .
Echo Press Enter to start Server 
Echo .
Pause

echo on


start firefox http://localhost:3000/
rails s

