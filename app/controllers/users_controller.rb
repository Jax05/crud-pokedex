class UsersController < ApplicationController
  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      redirect to '/pokedex'
    else
      redirect to '/signup'
    end
  end
end
