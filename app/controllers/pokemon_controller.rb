class PokemonController < ApplicationController
  get '/pokemon' do
    erb :'pokemon/index'
  end

  get '/pokemon/new' do
    erb :'pokemon/new'
  end

  post '/pokemon' do
    @pokemon = current_user.pokemon.build(params)
    if @pokemon.save
      redirect to '/pokemon'
    else
      redirect to '/pokemon/new'
    end
  end

  get '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    erb :'pokemon/show'
  end

  get '/pokemon/:id/edit' do
    @pokemon = Pokemon.find(params[:id])
    if current_user.pokemon.include?(@pokemon)
      erb :'pokemon/edit'
    else
      redirect to "/pokemon/#{@pokemon.id}"
    end
  end

  patch '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
  end
end
