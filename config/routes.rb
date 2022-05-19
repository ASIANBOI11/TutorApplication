Rails.application.routes.draw do
  resources :tutor_creations
  post 'checkout', to: 'tutor_creations#checkout'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'home/about'
  root 'home#index'
end
