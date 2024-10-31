Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  resources :items, only: %i[index show new create destroy edit update]
  resources :categories, only: %i[index show new create destroy edit update]

  get 'top-inzerat/:id', to: 'items#show'

  get 'kontact', to: 'pages#contact', as: :contact

  namespace :admin do
    resources :categories
  end
end
