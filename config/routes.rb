Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'beach#index'
  resources :beachs do
    collection do
      get 'serch'
    end
  end
  get 'beach/search', to: 'beach#search_index'
end
