Rails.application.routes.draw do
  devise_for :accounts

  root to: "public#home"

  get 'public/home'
  get 'public/help'
  get 'public/about'
  get 'public/contact'

  get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
