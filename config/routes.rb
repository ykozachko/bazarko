Rails.application.routes.draw do
  devise_for :users

  root 'pages#index'

  resources :items do
    delete 'image/:id', to: 'items#delete_image', as: 'delete_image'
  end

  resources :categories, only: %i[index show new create destroy edit update]

  get 'top-inzerat/:id', to: 'items#show'
  get 'kontact', to: 'pages#contact', as: :contact

  namespace :admin do
    resources :categories
  end
end