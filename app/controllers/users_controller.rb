class UsersController < ApplicationController
  get '/signup' do
    redirect to '/pokemon' if logged_in?
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
    redirect to '/pokemon' if logged_in?
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

  get '/logout' do
    session.clear
    redirect to '/login'
  end

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
end
