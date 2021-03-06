Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login/oauth/authorize', as: :github_login
  get '/logout', to: 'sessions#destroy'
  
  # resources :dashboard
  resources :users
end
