Rails.application.routes.draw do
  namespace :admins do
  	get 'homes/top'
  	get 'orders/index'
  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
