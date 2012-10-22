# Ruby on Rails Project: yardsale application

This is the yardsale application for CSCI 430 by Group #1. Getting the test suite to pass on your local machine:

    $ git clone git@github.com:csci430/yardsale_app.git
    $ cd yardsale_app
    $ bundle install
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    $ bundle exec rspec spec/

If the tests don't pass, it means there may be something wrong with your system.