require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session')
require_relative('../models/member')
also_reload('../models/*')

get '/session' do
  @sessions = Session.all
  erb(:"session/index")
end