Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: :index
  get "signup", to: "signup#new"
  post "signup", to: "signup#create"

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
end
