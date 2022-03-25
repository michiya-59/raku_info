# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'searches#search'

  root 'articles#home'

  resources :users do
    post :user_confirm, on: :new
    resources :relationships, only: [:create]
    resource :relationships, only: [:destroy]
    get 'followings', to: 'relationships#followings', as: 'followings'
    get 'followers', to: 'relationships#followers', as: 'followers'
  end

  resources :likes, only: [:destroy]
  resources :articles do
    resources :likes, only: [:create]
    post :article_confirm, on: :new
    member do
      post :article_confirm_edit, action: :article_confirm_edit
    end

    collection do
      get 'home'
      get 'ruby'
      get 'rails'
      get 'coldfusion'
      get 'sql'
      get 'others'
    end
  end

  resources :tags, param: :name
end
