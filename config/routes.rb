Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  namespace :api do
    resources :forms, only: [:index, :show] do
      resources :questions, only: [:index]
    end
    resources :responces, only: [:index, :show]
  end
end
