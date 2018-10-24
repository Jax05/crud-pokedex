class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "crud-pokedex-application"
  end

  get '/' do
    erb :index
  end

  get '/pokedex' do
    "Welcome to your Pokedex!"
  end
end
