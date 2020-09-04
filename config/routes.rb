Rails.application.routes.draw do
  devise_for :accounts
  resources :accounts, only: [] do
    resources :posts
  end
  # get "/profile" => "accounts#index"

  root to: "public#home"

  get 'home' => 'public#home'
  get 'help' => 'public#help'
  get 'about' => 'public#about'
  get 'contact' => 'public#contact'

end
