Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :items, only: %i[index show new create destroy edit update]
  resources :categories

  get 'top-inzerat/:id', to: 'items#show'

  get 'kontact', to: 'pages#contact', as: :contact
end
