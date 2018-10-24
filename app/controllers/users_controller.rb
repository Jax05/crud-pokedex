class UsersController < ApplicationController
  get '/signup' do
    erb :'users/new'
  end

  post '/' do
    user = User.new(params)
    
  end
end
