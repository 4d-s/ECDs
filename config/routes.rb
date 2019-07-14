Rails.application.routes.draw do
<<<<<<< HEAD
  get 'item_selects/index'
  get 'item_selects/create'
  get 'item_selects/update'
  get 'item_selects/destroy'
  devise_for :admins
	devise_for :users
=======
  namespace :user do
    get 'items/index'
    get 'items/show'
  end
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/edit'
  end

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  namespace :admin do
    resources :users, only: [:edit, :update, :index, :show]
  end
  namespace :user do
    get 'homes/top'
  end
	root 'user/homes#top'
>>>>>>> 696913074ee01178f166c5d828f82d653c53cb78
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	get 'admin' => 'admin/homes#top'
end