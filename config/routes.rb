Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'beach#index'
  resources :beachs, only: :index
  get 'beach/search', to: 'beach#search'
end
