Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  get 'products/edit'
  get 'products/index'
  get 'products/sho'
  get 'products/edit'
  get 'index/show'
  get 'index/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :administrator, controllers: {
    sessions:      'administrators/sessions',
    passwords:     'administrators/passwords',
    registrations: 'administrators/registrations'
  }

  namespace :administrators do
    resources :administrators
  end

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  resources :customers, only: [:show, :edit, :update]
  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
  resources :products

  root :to => "homes#top"

  get 'administrator' => "homes#administrator", :as => "homes_administrator"
  get 'administrator' => "administrator#top", :as => "administrator_top"
  get "/customers/quit" => "customers#quit", as: 'customers_quit'
  put "/customers/out" => "customers#out", as: 'customers_out'

end
