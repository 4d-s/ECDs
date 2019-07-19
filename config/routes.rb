Rails.application.routes.draw do

  devise_for :administrators, controllers: {
    sessions:      'administrators/sessions',
    passwords:     'administrators/passwords',
    registrations: 'administrators/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :users, only: [:edit, :update, :index, :show]
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :orders, only: [:index, :show, :edit, :update]
  end

  namespace :user do
    resources :addresses, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show] do
      resources :item_selects, only: [:create, :destroy]
    end
      resources :item_selects, only: [:index,:update]

    resources :orders, only: [:new, :create, :index]
    get 'orders/address' => 'orders/#address' ,as: 'order_address'
    post 'orders/address' => 'orders/#create_address' ,as: 'create_order_address'
  end

  # namespaceに属さないルーティング
  get '/admin' => 'admin/homes#top'
  get '/mypage', to: 'user/users#show'
  get '/mypage/edit', to: 'user/users#edit'
  patch '/user', to: 'user/users#update'
  post '/user' , to: 'user/users#create'

	root 'user/homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
