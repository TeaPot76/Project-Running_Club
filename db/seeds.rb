require_relative( "../models/customer.rb" )
require_relative( "../models/session.rb" )

require("pry-byebug")

Customer.delete_all
Session.delete_all

  customer1 = Customer.new({
   'first_name' => 'Alice',
   'last_name' => 'Cooper',
    'age' => 52,
    'level' => 1,
    'town' => 'Edinburgh'})

  customer2 = Customer.new({
    'first_name' => 'Steve',
    'last_name' => 'Harris',
    'age' => 48,
    'level' => 2,
    'town' => 'Edinburgh'})

  customer3 = Customer.new({
    'first_name' => 'Alice',
    'last_name' => 'Chains',
    'age' => 34,
    'level' => 2,
    'town' => 'Edinburgh'})

  customer4 = Customer.new({
    'first_name' => 'Mandy',
    'last_name' => 'Hall',
    'age' => 30,
    'level' => 3,
    'town' => 'Edinburgh'})

  customer5 = Customer.new({
    'first_name' => 'Angie',
    'last_name' => 'Will',
    'age' => 30,
    'level' => 1,
    'town' => 'Edinburgh'})

  customer6 = Customer.new({
    'first_name' => 'Bil',
    'last_name' => 'Ruby',
    'age' => 35,
    'level' => 2,
    'town' => 'Edinburgh'})

  customer7 = Customer.new({
    'first_name' => 'Anna',
    'last_name' => 'Holland',
    'age' => 27,
    'level' => 3,
    'town' => 'Edinburgh'})



       customer1.save
       customer2.save
       customer3.save
       customer4.save
       customer5.save
       customer6.save
       customer7.save

  session1 = Session.new({
    'name' => "Beginner road",
    'location' => "Water of Leith",
    'distance' => 5,
    'level' => 1,
    'day' => "Monday",
    'time_of_day' => 1730,
    'price' => 5,
    'customers_id' => customer1.id})

  session2 = Session.new({
    'name' => "Beginner hills",
    'location' => "Arthur Seat",
    'distance' => 5,
    'level' => 1,
    'day' => "Tuesday",
    'time_of_day' => 1730,
    'price' => 5,
    'customers_id' => customer5.id })

  session3 = Session.new({
   'name' => "Intermediate road",
   'location' => "Water of Leith",
   'distance' => 10,
   'level' => 2,
   'day' => "Wednesday",
   'time_of_day' => 1800,
   'price' => 5,
   'customers_id' => customer3.id })

  session4 = Session.new({
   'name' => "Intermediate hills",
   'location' => "Arthur Seat",
   'distance' => 10,
   'level' => 2,
   'day' => "Thursday",
   'time_of_day' => 1800,
   'price' => 5,
   'customers_id' => customer6.id })

  session5 = Session.new({
   'name' => "Advanced hills",
   'location' => "Pentlanad hills",
   'distance' => 20,
   'level' => 3,
   'day' => "Saturday",
   'time_of_day' => 1000,
   'price' => 5,
   'customers_id' => customer7.id })

   session1.save
   session2.save
   session3.save
   session4.save
   session5.save

   binding.pry
nil
