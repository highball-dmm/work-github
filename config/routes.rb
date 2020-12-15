Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
<<<<<<< HEAD
  resources :customers, only: [:show, :edit, :update]
  put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'


=======
  
    resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
>>>>>>> origin/develop
end
