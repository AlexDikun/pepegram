Rails.application.routes.draw do
  devise_for :accounts

  root to: "public#home"

  get 'home' => 'public#home'
  get 'help' => 'public#help'
  get 'about' => 'public#about'
  get 'contact' => 'public#contact'

end
