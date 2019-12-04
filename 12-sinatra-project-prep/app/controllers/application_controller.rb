require 'byebug'

class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    "<h1>Hello, World</h1>"
  end

  get '/failure' do
    erb :failure
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.new(user_params)
    if user.save
      redirect '/'
    else
      @errors = ["Signup failed"]
      erb :failure
    end
  end

  get '/login' do
    erb :login
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      unless logged_in?
        redirect '/login'
      end
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  post '/login' do
    # Find the user with this username
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/quotes'
    else
      @errors = ["Invalid username or password"]
      erb :failure
    end
  end

  private

  def user_params
    { username: params[:username], password: params[:password] }
  end
end
