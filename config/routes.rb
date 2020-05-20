Rails.application.routes.draw do

  devise_for :members, controllers: {
   sessions: 'members/sessions',
   registrations: 'members/registrations'
  }

  namespace :members do
    resource :members, only:[:show,:edit,:update]
    get 'members/withdrawal'
    resource :orders, only:[:index,:show]
    get 'orders/purchase_information'
    get 'orders/confirmation'
    get 'orders/thanks'
    post 'orders/select'
    resources :shipping_addresses,only:[:index,:show,:edit,:create,:update,:destroy]
    resources :cart_items,only:[:index,:show,:edit,:create,:update,:destroy]
    delete 'members/destroy_all'
    resources :products,only:[:index,:show]
  end

  namespace :admins do
  	get 'homes/top'
    resources :products, only:[:new,:create]
  	get 'orders/index'
  	get 'orders/show'
  	get 'members/show'
  	get 'members/edit'
    get 'members/index'

  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
