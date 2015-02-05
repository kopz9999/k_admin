Rails.application.routes.draw do

  resources :items

  mount KAdmin::Engine => "/k_admin"
end
