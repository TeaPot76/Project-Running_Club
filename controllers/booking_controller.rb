require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session')
require_relative('../models/member')
require_relative('../models/booking')

also_reload('../models/*')

get '/manager/bookings' do
  @bookings = Booking.all
  @members = Member.all
  @sessions = Session.all
  erb (:"booking/indexbookings")
end


get '/manager/bookings/new' do # new session form

  @sessions = Session.all
  @members = Member.all

  erb( :"booking/new")
end

get '/manager/bookings/:id' do
  # show
    @sessions = Session.all
    @members = Member.all
    @booking = Booking.find( params[:id] )
    erb( :"booking/show" )
end


post '/manager/bookings' do # create
  @sessions = Session.all
  @members = Member.all
  @booking= Booking.new( params )
  @booking.save()
  erb( :"booking/create")
end


get '/manager/bookings/:id/edit' do #edit booking
  @sessions = Session.all
  @members = Member.all
  @booking = Booking.find(params[:id])
  erb(:"booking/edit")
end

post '/manager/bookings/:id' do #update booking
  Booking.new(params).update
  redirect to '/manager/bookings'
end

post '/manager/bookings/:id/delete' do #delete member
  @booking = Booking.find(params[:id])
  @booking.delete
  redirect to '/manager/bookings'
end

# get '/manager/sessions' do
#   @bookings = Booking.all
#   @member = Member.all
#   @sessions = Session.all
#   erb(:"bookings/show")
# end


# get '/manager/sessions/members' do
#    @sessions = Session.all
#     @members =  Member.all
#    Member.sessions(params[:sessions_id])
#   erb (:"manager/session_member")
#  end
