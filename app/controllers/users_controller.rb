class UsersController < ApplicationController
  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to '/pokemon'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/pokemon'
    else
      redirect to '/login'
    end
  end

  get '/user/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end
end
