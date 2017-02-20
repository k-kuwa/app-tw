Rails.application.routes.draw do
    devise_for :users, controllers: { registrations: 'registrations' }
    root 'tweets#index'
    resources :tweets, only: %i(index new create show destroy) do
        resources :comments, only: %i(create destroy)
    end
    resources :users, only: %i(show)
end
