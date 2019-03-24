require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member')
require_relative('../models/session')
also_reload('../models/*')

get '/member' do
  @members = Member.all
  erb(:"/member/index")
end
