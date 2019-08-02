Rails.application.routes.draw do
  devise_for :users
  root 'letters#index'
  root 'records#index'
  resources :letters
  resources :records
  resources :records do
    collection { post :import }
  end
end
