Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :administrators, controllers: {
    sessions:      'administrators/sessions',
    passwords:     'administrators/passwords',
    registrations: 'administrators/registrations'
  }
  
  namespace :administrator do
   resources :genres, only: [:index, :create, :edit, :update, :show]
  end
  
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  root :to => "homes#top"

  get "/customers/quit" => "customers#quit", as: 'customers_quit'
  put "/customers/out" => "customers#out", as: 'customers_out'
  resources :customers, only: [:show, :edit, :update]

  resources :genres,only: [:index,:create,:edit,:update,:show]
  get 'administrator' => "homes#administrator", :as => "homes_administrator"

  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
  resources :administrators

end
