class PokemonController < ApplicationController
  get '/pokemon' do
    erb :'pokemon/index'
  end

  get 'pokemon/new' do
    erb :'pokemon/new'
  end
end
