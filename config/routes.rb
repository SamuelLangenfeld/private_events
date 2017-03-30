Rails.application.routes.draw do
  resources :events
  resources :users, only: [:new, :create, :show]
  root 'static_pages#home'
  get '/signin', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
