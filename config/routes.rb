Rails.application.routes.draw do
  devise_for :customers
  
  
  
  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
  
end
