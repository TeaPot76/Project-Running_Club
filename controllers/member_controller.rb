require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member')
require_relative('../models/session')
also_reload('../models/*')

get '/member' do
  @members = Member.all
  erb(:"/member/index")
end

# get '/session' do # index
#   @sessions = Session.all()
#   erb( :"member/index" )
# end
#
# get '/session/:id' do # show
#   @session = Session.find( params[:id] )
#   erb( :"session/show" )
# end

get '/member/:id' do # show
  @member = Member.find( params[:id] )
  erb( :"member/show" )
end
