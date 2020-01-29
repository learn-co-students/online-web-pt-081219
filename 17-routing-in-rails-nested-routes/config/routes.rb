Rails.application.routes.draw do
  get '/authors/:author_id/books/:id/delete', to: 'books#destroy', as: 'author_book_delete'
  resources :authors, only: [:index] do
    resources :books
  end

  resources :books, only: [:new, :create]
end
