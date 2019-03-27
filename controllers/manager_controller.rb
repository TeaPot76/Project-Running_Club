require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session')
require_relative('../models/member')
also_reload('../models/*')

get '/manager' do
  erb (:"manager/index")
end

get '/manager/sessions' do
  @sessions = Session.all
  @session_by_day = Session.all_by_day
  erb(:"manager/sessions")
end

  get '/manager/members' do
  @members = Member.all
  @sessions = Session.all
  erb(:"manager/members")
end

get '/manager/members/new' do # new member form
  @sessions = Session.all
  # @bookings = Booking.all
  erb( :"manager/newmember")
end

get '/manager/sessions/new' do # new session form
  erb( :"manager/new_session")
end

get '/manager/session/:id' do # show
  @session = Session.find( params[:id] )
  erb( :"manager/show_session" )
end


get '/manager/member/:id' do # show
  @member = Member.find( params[:id] )
  erb( :"manager/show" )
end

post '/manager/members' do # create
  @member = Member.new( params )
  @member.save()
  erb( :"manager/createmember")
end

post '/manager/sessions' do # create
  # @session = Session.new( params )
  @session.save()
  erb( :"manager/create")
end


get '/manager/:id/edit' do #edit member
  # @sessions = Session.all
  # @bookings = Booking.all
  @member = Member.find(params[:id])
  erb(:"manager/edit")
end

get '/manager/session/:id/edit' do #edit session
  @session = Session.find(params[:id])
  erb(:"manager/edit_session")
end

post '/manager/members/:id' do #update member
  Member.new(params).update
  redirect to '/manager'
end

post '/manager/sessions/:id' do #update session
  Session.new(params).update
  redirect to '/manager'
end

post '/manager/:id/delete' do #delete member
  member = Member.find(params[:id])
  member.delete
  redirect to '/manager/members'
end

post '/manager/session/:id/delete' do #delete session
  session = Session.find(params[:id])
  session.delete
  redirect to '/manager/sessions'
end

# get '/manager/sessions/members' do
#    @sessions = Session.all
#     @members =  Member.all
#    Member.sessions(params[:sessions_id])
#   erb (:"manager/session_member")
#  end
