# frozen_string_literal: true

Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  get 'articles/new'
  get 'articles/create'
  get 'articles/edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'users#new'
  resources :users do
    post :user_confirm, on: :new
  end
end
