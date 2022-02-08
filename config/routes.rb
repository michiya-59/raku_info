# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  root 'users#new'
  resources :users do
    post :user_confirm, action: :user_confirm_new, on: :new
  end
end
