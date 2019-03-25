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
  @session = Session.new( params )
  @session.save()
  erb( :"manager/create")
end


get '/manager/:id/edit' do #EDIT
  @member = Member.find(params[:id])
  erb(:"manager/edit")
end

post '/manager/members/:id' do #UPDATE
  Member.new(params).update
  redirect to '/manager'
end

post '/manager/:id/delete' do #DELETE
  member = Member.find(params[:id])
  member.delete
  redirect to '/manager/members'
end
