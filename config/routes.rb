Rails.application.routes.draw do

  devise_for :members, controllers: {
   sessions: 'members/sessions',
   registrations: 'members/registrations'
  }



  namespace :admins do
  	get 'homes/top'
  	get 'orders/index'
  	get 'orders/show'
  	get 'members/show'
  	get 'members/edit'
    get 'members/index'
  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }

  namespace :members do
    resources :products
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
