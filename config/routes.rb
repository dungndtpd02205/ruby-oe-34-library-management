Rails.application.routes.draw do
  root "static_pages#home"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:create, :new]
  resources :books, only: [:index, :show]
  resources :request_borrow_books, only: :create
  resources :authors, only: :show

  resources :books do
    resources :request_borrow_books, only: :new
  end

  namespace :admin do
    resources :request_borrow_books, except: [:edit, :show, :new]
    resources :authors, except: :show
  end
end
