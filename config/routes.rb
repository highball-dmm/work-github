Rails.application.routes.draw do
  devise_for :customers
  
  
  
  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
  
  devise_for :administrators, controllers: {
    sessions:      'administrators/sessions',
    passwords:     'administrators/passwords',
    registrations: 'administrators/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  root :to => "homes#top"
end
