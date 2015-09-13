Rails.application.routes.draw do

  devise_for :users, defaults: { format: :json }

  namespace :api, defaults: { format: :json } do

    resources :responses, only: [:show, :create]

    resources :forms, only: [:index, :show] do
      resources :questions, only: [:index]
    end

  end

  root 'home#index'

end
