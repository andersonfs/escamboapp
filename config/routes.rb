# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :admins, except: [:show]
    resources :categories, except: %i[show destroy]
    resources :diagrams, only: [:index]
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
