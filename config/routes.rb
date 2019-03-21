Rails.application.routes.draw do
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :reviews, only: [:index, :create]
  resources :questions, only: [:index, :create, :show] do
    resources :replies
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
