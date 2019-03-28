require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member')
require_relative('../models/session')
also_reload('../models/*')

# get '/member' do
#   @members = Member.all
#   erb(:"/member/index")
# end

get '/member' do # index
  @sessions = Session.all()
  @booking = Booking.all
  erb( :"member/sessions" )
end
#
# get '/session/:id' do # show
#   @session = Session.find( params[:id] )
#   erb( :"session/show" )
# end

get '/member/show' do # show
  @booking = Booking.all
  @sessions= Session.all_by_day
  erb( :"member/show" )
end
