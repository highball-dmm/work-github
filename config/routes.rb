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

  resources :customers, only: [:show, :edit, :update]
  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
  resources :products

  get 'about' => 'customer/products#about'
  get "/homes/top" => "homes#top"
  get "/administrator/top" => "administrator/products#top", :as => "administrator_customer_top"


  root :to => "homes#top"

  resources :genres,only: [:index,:create,:edit,:update,:show]
  get 'administrator' => "homes#administrator", :as => "homes_administrator"
  get 'administrator' => "administrator#top", :as => "administrator_top"
  get "/customers/quit" => "customers#quit", as: 'customers_quit'
  put "/customers/out" => "customers#out", as: 'customers_out'

   scope module: :customer do
    get 'customers/products' => 'customer/products#index'
    get 'customers/products/:id' => 'customer/products#show'


  	resource :customers, only: [:show] do
  		collection do
  	     get 'quit'
  	     patch 'out'
  	  end
  	  resources :cart_items,only: [:index,:update,:create,:destroy] do
        collection do
          delete '/' => 'cart_items#all_destroy'
        end
      end
    end
  end
  
  
  
  



  namespace :customer do
    resources :customers, only: [:edit, :update]
  end

end


