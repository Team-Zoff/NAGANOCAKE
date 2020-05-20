Rails.application.routes.draw do

  # devise_for :members, controllers: {
   # sessions: 'members/sessions',
   # registrations: 'members/registrations'
  # }

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

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
    get 'admins/password/edit' => 'admins/passwords#edit', as: 'edit_admin_password'
    patch 'admins/password' => 'admins/passwords#update', as: 'admin_password'
  end

  namespace :admins do
  	get 'homes/top'
  	get 'order_details/update'
    resources :genres, only:[:create, :index, :edit, :update]
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :members, only:[:index, :show, :edit, :update]
  end
  # devise_for :admins, controllers: {
  	# sessions: 'admins/sessions'
  # }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
