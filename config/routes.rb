Rails.application.routes.draw do
  devise_for :users
  root to: "my/lists#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :my do
    resources :lists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :participation, only: [:new, :create]
    end
  end

  namespace :my_community do
    resources :lists, only: [:show, :index]
  end

  resources :gifts, only: [:index, :update]
end
