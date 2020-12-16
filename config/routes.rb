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

  get 'about' => 'customer/products#about'
  root :to => 'customer/products#top'
  get "/homes/top" => "homes#top"


  resources :genres,only: [:index,:create,:edit,:update,:show]
  get 'administrator' => "homes#administrator", :as => "homes_administrator"

  resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
  resources :administrators

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


