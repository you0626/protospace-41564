Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  get 'prototypes/index'
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create]
  end
  
end
