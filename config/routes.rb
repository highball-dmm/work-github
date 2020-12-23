Rails.application.routes.draw do

  get 'search/search'
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
    resources :products
  end

  get 'about' => 'customer/products#about'
  root :to => "customer/products#top"
  get "/homes/top" => "homes#top"
  get "/administrator/top" => "administrator/products#top", :as => "administrator_customer_top"


  get 'administrator' => "homes#administrator", :as => "homes_administrator"
  get 'administrator' => "administrator#top", :as => "administrator_top"



   scope module: :customer do
    get 'customers/products' => 'products#index'
    get 'customers/products/:id' => 'products#show',as: 'customers_product'


      scope :customers do
       resources :cart_items,only: [:index,:update,:create,:destroy] do
         collection do
           delete '/' => 'cart_items#all_destroy'
         end
       end
       resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
     end

  	resource :customers, only: [:show] do
  		collection do
  	     get 'quit'
  	     patch 'out'
  	     end
    end




  end

  namespace :customer do
    resources :customers
  end


  namespace :administrator do
    resources :orders
  end

  namespace :customer do
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'log'
        get 'thanx'
      end
    end
  end

  namespace :administrator do
    resources :order_items, only: [:update]
  end

end
