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
  erb(:"manager/sessions")
end

  get '/manager/members' do
  @members = Member.all
  erb(:"manager/members")
end

get '/manager/members/new' do # new member form
  erb( :"manager/newmember")
end

get '/manager/new' do # new session form
  erb( :"manager/new")
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
