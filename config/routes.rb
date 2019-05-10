Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :houses, only: [:index, :show, :new, :join, :edit]
  resources :chores, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :houses, only: [:index, :show, :update]
      resources :users, only: [:update]
    end
  end
end
