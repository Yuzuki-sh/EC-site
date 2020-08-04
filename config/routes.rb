Rails.application.routes.draw do
  devise_for :admins, path: :admin, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {   
    registrations: 'end_users/registrations',
    sessions: 'end_users/sessions' }

  root 'end_users/items#top'

  get "end_users/withdrow" => "end_users#withdrow"
  patch "end_users/switch" => "end_users#switch"
  resource :end_users
  
  get "items" => "end_users/items#index"
  get "items/:id" => "end_users/items#show"


  get 'admin' => 'admins/homes#top'
  get 'admin/end_users' => 'admins/end_users#index'
  namespace :admins, path: :admin do
    resources :genre, :only => [:index, :create, :edit, :update]
    resources :items, :only => [:index, :new, :create, :show, :edit, :update]
  end
  # scope module: :admins do
  #   resources :items, :only => [:index, :new, :create, :show, :edit, :update]
  # end
  # resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
