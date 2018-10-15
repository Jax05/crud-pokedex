class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "crud-pokedex-application"
  end

  get '/' do
    "Hello world!"
  end
end