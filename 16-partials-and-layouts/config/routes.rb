# frozen_string_literal: true

Rails.application.routes.draw do
  get 'genres/index'
  get 'authors/index'
  get 'books/index'
  get 'books/create'
  get 'books/new'
  get 'books/edit'
  get 'books/update'
  resources :books, only: %i[index new create edit update destory]
  resources :authors, only: [:index]
  resources :genres, only: [:index]
end
