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
end
