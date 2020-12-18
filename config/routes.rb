Rails.application.routes.draw do


  devise_for :administrator, controllers: {
    sessions:      'administrators/sessions',
    passwords:     'administrators/passwords',
    registrations: 'administrators/registrations'
  }


  namespace :administrator do
    resources :genres, only: [:index, :create, :edit, :update, :show]
  end

  namespace :administrator do
    resources :customers
  end

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }


  namespace :administrator do
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
  end


  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]

  get 'about' => 'customer/products#about'
  root :to => "customer/products#top"
  get "/homes/top" => "homes#top"
  get "/administrator/top" => "administrator/products#top", :as => "administrator_customer_top"



  resources :genres,only: [:index,:create,:edit,:update,:show]
  get 'administrator' => "homes#administrator", :as => "homes_administrator"
  get 'administrator' => "administrator#top", :as => "administrator_top"
  get "/customers/quit" => "customers#quit", as: 'customers_quit'
  put "/customers/out" => "customers#out", as: 'customers_out'

   scope module: :customer do
    get 'customers/products' => 'products#index'
    get 'customers/products/:id' => 'products#show', as: 'customers_product'



  	resource :customers, only: [:show] do
  		collection do
  	     get 'quit'
  	     patch 'out'
  	  end
    end
  end

  namespace :customer do
    resources :customers
    resources :orders, only: [:new,:index,:show,:create] do
      collection do
        get 'log'
        get 'thanx'
      end
    end
  end





end


