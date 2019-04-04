Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders
  resource :cart
  resources :projects
  resources :products do
    resources :order_items
  end



  
  get 'info', to: 'projects#info'
  get 'shop', to: 'products#index'

  root 'projects#index'
end
