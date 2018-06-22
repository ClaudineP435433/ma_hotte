Rails.application.routes.draw do
  devise_for :users
  root to: "lists#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :participations, only: [:new, :create]
  end

  namespace :participants do
    resources :lists, only: [:show, :index]
  end

  resources :gifts, only: [:index, :update]


end
