# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
    end

    resources :ad_detail, only: [:show]
    resources :categories, only: [:show]
    resources :comments, only: [:create]
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: %i[edit create]
    resources :admins, except: [:show]
    resources :categories, except: [:show, :destroy]
    resources :diagrams, only: [:index]
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions' }
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
