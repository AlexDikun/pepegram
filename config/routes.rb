# config/routes.rb
# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  resources :accounts, only: %i[show edit update] do
    resources :posts
    resources :followers, only: :index
    resources :followings, only: :index
  end

  resources :follows, only: %i[create destroy]
  resources :feed_posts, only: :index

  resources :posts, only: [] do
    resources :comments, only: %i[new create destroy]
  end

  root to: 'public#home'

  get 'home' => 'public#home'
  get 'help' => 'public#help'
  get 'about' => 'public#about'
  get 'contact' => 'public#contact'
end
