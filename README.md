# Ruby on Rails Project: yardsale application

This is the yardsale application for CSCI 430 by Group #1. Getting the test suite to pass on your local machine:

    $ git clone https://git@github.com:csci430/yardsale_app.git
    $ cd yardsale_app
    $ bundle install
    $ rake db:migrate
    $ rake db:populate
    $ rake db:test:prepare

If the tests don't pass, it means there may be something wrong with your system.