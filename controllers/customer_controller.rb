require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer')
require_relative('../models/session')
also_reload('../models/*')

get '/customer' do
  @customers = Customer.all
  erb(:"/customer/index")
end
