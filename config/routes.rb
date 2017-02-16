Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'tweets#index'
  resources :tweets, only: %i(index new create)
  resources :users, only: %i(show)
end
