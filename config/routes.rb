Rails.application.routes.draw do

  devise_for :members, controllers: {
   sessions: 'members/sessions',
   registrations: 'members/registrations'
  }


  namespace :admins do
  	get 'homes/top'
  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
