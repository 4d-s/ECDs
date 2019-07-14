Rails.application.routes.draw do
  namespace :user do
    get 'addresses/index'
    get 'addresses/new'
    get 'addresses/edit'
  end
  get 'addresses/index'
  get 'addresses/new'
  get 'addresses/edit'
  get 'addresses/update'
  get 'addresses/destroy'
  namespace :admin do
    resources :users, only: [:edit, :update, :index, :show]
  end
  namespace :user do
    get 'homes/top'
  end
  devise_for :admins
	devise_for :users
	root 'user/homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 	  get 'admin' => 'admin/homes#top'
    get '/mypage', to: 'user/users#show'
    get '/mypage/edit', to: 'user/users#edit'
    patch '/user', to: 'user/users#update'
    post '/user' , to: 'user/users#create'
end
