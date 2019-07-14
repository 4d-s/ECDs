Rails.application.routes.draw do
  get 'item_selects/index'
  get 'item_selects/create'
  get 'item_selects/update'
  get 'item_selects/destroy'
  devise_for :admins
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
