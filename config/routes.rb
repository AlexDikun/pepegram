Rails.application.routes.draw do
  devise_for :accounts

  resources :accounts, only: [:show, :edit, :update] do
    resources :posts
    resources :followers, only: :index
    resources :followings, only: :index
  end

  resources :follows, only: [:create, :destroy]

  root to: "public#home"

  get 'home' => 'public#home'
  get 'help' => 'public#help'
  get 'about' => 'public#about'
  get 'contact' => 'public#contact'

end
