class PokemonController < ApplicationController
  get '/pokemon' do
    redirect to '/login' unless logged_in?
    @pokemon = Pokemon.all
    erb :'pokemon/index'
  end

  get '/pokemon/new' do
    redirect to '/login' unless logged_in?
    erb :'pokemon/new'
  end

  post '/pokemon' do
    @pokemon = current_user.pokemon.build(params)
    if @pokemon.save
      redirect to '/pokemon'
    else
      flash[:error] = "All fields are required."
      erb :'pokemon/new'
    end
  end

  get '/pokemon/:id' do
    redirect to '/login' unless logged_in?
    @pokemon = Pokemon.find(params[:id])
    erb :'pokemon/show'
  end

  get '/pokemon/:id/edit' do
    redirect to '/login' unless logged_in?
    @pokemon = Pokemon.find(params[:id])
    if current_user.pokemon.include?(@pokemon)
      erb :'pokemon/edit'
    else
      redirect to "/pokemon/#{@pokemon.id}"
    end
  end

  patch '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update(params[:pokemon])
      redirect to "/pokemon/#{@pokemon.id}"
    else
      flash[:error] = "All fields are required."
      redirect to "/pokemon/#{@pokemon.id}/edit"
    end
  end

  delete '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    if current_user.pokemon.include?(@pokemon)
      @pokemon.destroy
      redirect to '/pokemon'
    else
      redirect to "/pokemon/#{@pokemon.id}"
    end
  end
end
