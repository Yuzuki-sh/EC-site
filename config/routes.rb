Rails.application.routes.draw do
  devise_for :admins, path: :admin, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {   
    registrations: 'end_users/registrations',
    sessions: 'end_users/sessions' 
  }

  root 'end_users/items#top'

  get "end_users/withdrow" => "end_users#withdrow"
  patch "end_users/switch" => "end_users#switch"
  resource :end_users
  
  get "items" => "end_users/items#index"
  get "items/:id" => "end_users/items#show", as: 'item'
  post "item_search" => "end_users/items#search"

  get 'admin' => 'admins/homes#top'
  get 'admin/end_users' => 'admins/end_users#index'
  namespace :admins, path: :admin do
    resources :genre,         :only => [:index, :create, :edit, :update]
    resources :items,         :only => [:index, :new, :create, :show, :edit, :update]
    resources :orders,        :only => [:index, :show, :update]
    resources :order_details, :only => [:index, :update]
  end

  delete 'end_users/cart_items/destroy_all'
  post 'end_users/orders/confirm'
  get 'end_users/orders/complete' => 'end_users/orders#complete'
  namespace :end_users do
    resources :cart_items,    :only => [:index, :update, :destroy, :create]
    resources :orders,        :only => [:index, :show, :new, :create]
    resources :addresses,     :except => [:show, :new]
    resources :order_details, :only => [:index, :show]
    resources :genres,        :only => [:show]
  end
end
