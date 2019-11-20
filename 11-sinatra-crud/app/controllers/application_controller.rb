class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
  end

  get '/' do
    'Hello, World!'
  end
end
