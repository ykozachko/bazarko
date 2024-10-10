Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :items, only: %i[index show new create destroy edit update]
  resources :categories, only: %i[index show new create destroy edit update]

  get 'top-inzerat/:id', to: 'items#show'
  # get 'filter/:status', to: 'items#show)'
end
