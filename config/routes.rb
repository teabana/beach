Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'beachs#index'
  resources :beachs do
    collection do
      get 'search'
    end
  end
  get 'beach/search', to: 'beachs#search_index'
end
