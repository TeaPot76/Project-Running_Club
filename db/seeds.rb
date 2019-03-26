require_relative( "../models/session.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )

require("pry-byebug")

 Member.delete_all
 Session.delete_all
 Booking.delete_all
  session1 = Session.new({
    'name' => "Beginner road",
    'location' => "Water of Leith",
    'distance' => 5,
    'level' => 1,
    'day' => 20190330,
    'time_of_day' => 1730,
    'price' => 5,
    'max_number' => 10})

  session2 = Session.new({
    'name' => "Beginner hills",
    'location' => "Arthur Seat",
    'distance' => 5,
    'level' => 1,
    'day' => 20190331,
    'time_of_day' => 1730,
    'price' => 5,
    'max_number' => 10 })

  session3 = Session.new({
   'name' => "Intermediate road",
   'location' => "Water of Leith",
   'distance' => 10,
   'level' => 2,
   'day' => 20190401,
   'time_of_day' => 1800,
   'price' => 7,
   'max_number' =>10
    })

  session4 = Session.new({
   'name' => "Intermediate hills",
   'location' => "Arthur Seat",
   'distance' => 10,
   'level' => 2,
   'day' => 20190402,
   'time_of_day' => 1800,
   'price' => 7,
   'max_number' => 8
    })

  session5 = Session.new({
   'name' => "Advanced hills",
   'location' => "Pentlanad hills",
   'distance' => 20,
   'level' => 3,
   'day' => 20190403,
   'time_of_day' => 1000,
   'price' => 10,
   'max_number' => 5
    })

    # session5.location = "Pentland Hills"
   # #  # session5.update
   session1.save
   session2.save
   session3.save
   session4.save
   session5.save

  member1 = Member.new({
   'first_name' => 'Alice',
   'last_name' => 'Cooper',
    'age' => 52,
    'level' => 1,
    'town' => 'Edinburgh'
    })

  member2 = Member.new({
    'first_name' => 'Steve',
    'last_name' => 'Harris',
    'age' => 48,
    'level' => 2,
    'town' => 'Edinburgh'})

  member3 = Member.new({
    'first_name' => 'Alice',
    'last_name' => 'Chains',
    'age' => 34,
    'level' => 2,
    'town' => 'Edinburgh'})

  member4 = Member.new({
    'first_name' => 'Mandy',
    'last_name' => 'Hall',
    'age' => 30,
    'level' => 1,
    'town' => 'Edinburgh'})

  member5 = Member.new({
    'first_name' => 'Angie',
    'last_name' => 'Will',
    'age' => 30,
    'level' => 1,
    'town' => 'Edinburgh'})

  member6 = Member.new({
    'first_name' => 'Bil',
    'last_name' => 'Ruby',
    'age' => 35,
    'level' => 2,
    'town' => 'Edinburgh'})

  member7 = Member.new({
    'first_name' => 'Anna',
    'last_name' => 'Holland',
    'age' => 27,
    'level' => 3,
    'town' => 'Edinburgh'})


     # #
     member1.save
     member2.save
     member3.save
     member4.save
     member5.save
     member6.save
     member7.save

  booking1 = Booking.new({
    'instructor_name' => 'Eddie',
    'members_id' => member1.id,
    'sessions_id' => session1.id
      })
  booking2 = Booking.new({
    'instructor_name' => 'Alan',
    'members_id' => member2.id,
    'sessions_id' => session1.id
        })
  booking3 = Booking.new({
   'instructor_name' => 'Dan',
    'members_id' => member3.id,
    'sessions_id' => session3.id})

  booking4 = Booking.new({
      'instructor_name' => 'Eddie',
      'members_id' => member4.id,
      'sessions_id' => session3.id
        })
  booking5 = Booking.new({
      'instructor_name' => 'Alan',
      'members_id' => member5.id,
      'sessions_id' => session4.id
          })
  booking6 = Booking.new({
     'instructor_name' => 'Dan',
      'members_id' => member7.id,
      'sessions_id' => session5.id})
  #
  booking1.save
  booking2.save
  booking3.save
  booking4.save
  booking5.save
  booking6.save


   binding.pry
nil
