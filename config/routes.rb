Rails.application.routes.draw do

devise_for :members, skip: :all
  devise_scope :member do
    get '/members/sign_in' => 'members/sessions#new', as: 'new_member_session'
    post '/members/sign_in' => 'members/sessions#create', as: 'member_session'
    delete '/members/sign_out' => 'members/sessions#destroy', as: 'destroy_member_session'
    get '/members/sign_up' => 'members/registrations#new', as: 'new_member_registration'
    post '/members/sign_up' => 'members/registrations#create', as: 'member_registration'
    get '/members/' => 'members/passwords#edit', as: 'edit_member_password'
    patch '/members/passwords' => 'members/passwords#update', as: 'member_password'
    get '/members/passwords/new' => 'members/passwords#new',as: 'member_forgot_password'
  end


  namespace :members do
    resource :member, only:[:show,:edit,:update]
    get 'members/withdrawal' => 'members#withdrawal',as: 'withdrawal'
    get 'homes/top' => 'homes#top',as: '/'
    resource :orders, only:[:index,:show]
    get 'orders/purchase_information'
    get 'orders/confirmation'
    get 'orders/thanks'
    post 'orders/select'
    resources :shipping_addresses,only:[:index,:show,:edit,:create,:update,:destroy]
    resources :cart_items,only:[:index,:show,:edit,:create,:update,:destroy]
    delete 'members/destroy_all'
    resources :products, only:[:index,:show]
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
      resources :genres, only:[:create, :index, :edit, :update]
      resources :products, only:[:index, :new, :create, :show, :edit, :update]
      resources :orders, only:[:index, :show, :update]
      resources :members, only:[:index, :show, :edit, :update]
      get 'homes/top' => 'homes#top',as: '/'
      patch 'order/show' => 'order_detail#update',as: 'order_status'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
