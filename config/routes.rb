Rails.application.routes.draw do

  devise_for :users, defaults: { format: :json }

  namespace :api, defaults: { format: :json } do

    resources :forms, only: [:index, :show] do
      resources :questions, only: [:index]
      resources :responses, only: [:index]
    end

    resources :responses, only: [:show, :create, :index]
  end

  root 'home#index'

end
