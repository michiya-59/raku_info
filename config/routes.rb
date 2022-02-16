# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'users#new'
  resources :users do
    post :user_confirm, on: :new
  end

  resources :articles do
    post :article_confirm, on: :new
  end

  resources :tags, param: :name
end
