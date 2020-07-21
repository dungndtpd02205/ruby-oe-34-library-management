Rails.application.routes.draw do
  root "static_pages#home"

  resources :books, only: [:index, :show]
end
