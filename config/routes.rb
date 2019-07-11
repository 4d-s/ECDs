Rails.application.routes.draw do
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
end
