class PokemonController < ApplicationController
  get '/pokemon' do
    erb :'pokemon/index'
  end
end
