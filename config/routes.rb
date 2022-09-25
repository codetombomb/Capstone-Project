Rails.application.routes.draw do
  get 'haunted_bnbs', to: 'haunted_bnbs#index'
  get 'haunted_bnbs/:id', to: 'haunted_bnbs#show'
  post 'signup', to: 'guests#create'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :guests
  resources :haunted_bnbs
  resources :reservations
  resources :reviews
end
