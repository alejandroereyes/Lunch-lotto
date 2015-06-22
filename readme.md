#Lunch Lotto
  This app pairs 2 individuals who want to network over lunch. Users will create an account and will have the opportunity to be matched up with one other user per day.

##To Use
  Go to `https://lunch-lotto.herokuapp.com/` and follow the links to create an account and get matched.

##Details
  * Ruby version 2.20
  * Dependancies
    * gem pg
    * gem puma
    * gem rails-assets-underscore
    * gem rails-assets-backbone
    * gem rails-assets-react
    * gem rails-assets-moment
    * gem rails-assets-validator
    * gem rails_12factor

##Installation Steps - if you wish to have locally
  * Go to `https://github.com/alejandroereyes/Lunch-lotto`
  * Clone this repo
  * Run `gem install bundler`
  * Run `bundle install`
  * Run `rake db:create` <-- Only the first time. _(Will need to have postgres setup and running)_
  * Run `rake db:migrate`
  * Run `rails s` to start the server
