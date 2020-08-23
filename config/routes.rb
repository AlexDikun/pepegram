Rails.application.routes.draw do

  root to: "info_pages#about" # "public#homepage"
  get 'info_pages/about'
  get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
