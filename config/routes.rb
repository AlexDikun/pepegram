Rails.application.routes.draw do

  devise_for :accounts
  root to: "info_pages#home" # "public#homepage"
  get 'info_pages/home'
  get 'info_pages/about'
  get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
