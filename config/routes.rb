Rails.application.routes.draw do
  root 'home#index'
  post 'user_curriculum/develop', to: 'user_curriculum#develop', as: 'custom_route'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
