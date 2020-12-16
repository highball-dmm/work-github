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
<<<<<<< HEAD

  namespace :administrators do
    resources :administrators
  end

=======
  
  namespace :administrator do
   resources :genres, only: [:index, :create, :edit, :update, :show]
  end
  
>>>>>>> origin/develop
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

<<<<<<< HEAD
  resources :customers, only: [:show, :edit, :update]
  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
  resources :products
=======
  get 'about' => 'customer/products#about'
  root :to => 'customer/products#top'
  get "/homes/top" => "homes#top"
>>>>>>> origin/develop

  root :to => "homes#top"

  resources :genres,only: [:index,:create,:edit,:update,:show]
  get 'administrator' => "homes#administrator", :as => "homes_administrator"
  get 'administrator' => "administrator#top", :as => "administrator_top"
  get "/customers/quit" => "customers#quit", as: 'customers_quit'
  put "/customers/out" => "customers#out", as: 'customers_out'

  scope module: :customer do
    get 'customers/products' => 'customer/products#index'
    get 'customers/products/:id' => 'customer/products#show'
    get 'customers/edit' => 'customers#edit'
    put 'customers' => 'customers#update'

  	resource :customers,only: [:show] do
  		collection do
  	     get 'quit'
  	     patch 'out'
  	  end
    end
  end

  resources :customers, only: [:show, :edit, :update]


end


