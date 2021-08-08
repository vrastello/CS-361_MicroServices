  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  mount API::Base, at: "/"

  get "store_lookup", to: "store_lookup#new"
  post "store_lookup", to: "store_lookup#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "item", to: "item#edit", as: :edit_item
  patch "item", to: "item#update", as: :update_item
  post "item", to: "item#create"
  get "cart_item", to: "item#cart"
  delete "delete_item", to: "item#destroy"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "quit", to: "main#destroy"
  get "sure", to: "main#edit"
  post "/", to: "main#create", as: :create_list
  root to: "main#index"
end
