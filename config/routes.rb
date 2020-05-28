Rails.application.routes.draw do

root to: 'members/homes#top'

devise_for :members, skip: :all
  devise_scope :member do
    get '/members/sign_in' => 'members/sessions#new', as: 'new_member_session'
    post '/members/sign_in' => 'members/sessions#create', as: 'member_session'
    delete '/members/sign_out' => 'members/sessions#destroy', as: 'destroy_member_session'
    get '/members/sign_up' => 'members/registrations#new', as: 'new_member_registration'
    get '/members/passwords/edit' => 'members/registrations#edit', as: 'password_edit_registrations'
    patch '/members/passwords/update' => 'members/registrations#update'
    post '/members/sign_up' => 'members/registrations#create', as: 'member_registration'
    get '/members/' => 'members/passwords#edit', as: 'edit_member_password'
    patch '/members/passwords' => 'members/passwords#update', as: 'member_password'
    get '/members/passwords/new' => 'members/passwords#new',as: 'member_forgot_password'
  end

  namespace :members do
    get 'homes/top' => 'homes#top',as: '/'
    get 'orders/purchase_information' => 'orders#purchase_information',as: 'order_purchase'
    get 'orders/confirmation' => 'orders#confirmation',as: 'order_confirmation'
    get 'orders/thanks' => 'orders#thanks',as: 'order_thanks'
    post 'orders/select'
    resources :orders, only:[:index,:show,:create]
    get 'members/withdrawal' => 'members#withdrawal',as: 'withdrawal'
    patch 'members/withdrawal' => 'members#withdrawal_confirm', as: 'withdrawal_confirm'
    delete 'members/cart_items' => 'cart_items#destroy_all',as: 'cart_items_destroy'
    resource :member, only:[:show,:edit,:update]
    resources :shipping_addresses,only:[:index,:show,:edit,:create,:update,:destroy]
    resources :cart_items,only:[:index,:create,:update,:destroy]
    resources :products, only:[:index,:show]
    resources :genres,only:[:show]
    get "/searches/search" => "searches#search", as: 'search'
  end

  devise_for :admins, skip: :all
    devise_scope :admin do
      get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
      post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'

    authenticated :admin do
      delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
      get 'admins/password/edit' => 'admins/passwords#edit', as: 'edit_admin_password'
      patch 'admins/password' => 'admins/passwords#update', as: 'admin_password'
      get 'admins/passwords/new' => 'admins/password#new', as: 'admin_forgot_password'
    end
  end

  authenticated :admin do
      namespace :admins do
      get 'homes/top' => 'homes#top',as: '/'
      resources :genres, only:[:create, :index, :edit, :update]
      resources :products, only:[:index, :new, :create, :show, :edit, :update]
      patch 'order/show' => 'order_detail#update',as: 'order_status'
      resources :orders, only:[:index, :show, :update]
      resources :members, only:[:index, :show, :edit, :update]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
