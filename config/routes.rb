Rails.application.routes.draw do

  #devise_for :members, controllers: {
   #sessions: 'members/sessions',
   #registrations: 'members/registrations'
  #}

  namespace :members do
    resources :products
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


  devise_for :members, skip: :all
  devise_scope :members do
    get '/members/sign_in' => 'members/sessions#new', as: 'new_member_session'
    post '/members/sign_in' => 'members/sessions#create', as: 'member_session'
    delete '/members/sign_out' => 'members/sessions#destroy', as: 'destroy_member_session'
    get '/members/sign_up' => 'members/registrations#new', as: 'new_member_registration'
    post '/members/sign_up' => 'members/registrations#create', as: 'member_registration'
    get '/members/' => 'members/passwords#edit', as: 'edit_member_password'
    patch '/members/' => 'members/passwords#update', as: 'member_password'
  end

  namespace :users do
    resources :posts
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
