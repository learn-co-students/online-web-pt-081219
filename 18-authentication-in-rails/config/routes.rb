Rails.application.routes.draw do
  root 'application#hello'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
end
