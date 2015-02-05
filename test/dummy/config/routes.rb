Rails.application.routes.draw do

  resources :items
  resources :login

  mount KAdmin::Engine => "/k_admin"
end
