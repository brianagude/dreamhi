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
  get 'photography', to: 'projects#photography'
  get 'archives', to: 'projects#archives'
  get 'design', to: 'projects#design'
  get 'lookbook', to: 'projects#lookbook'
  get 'contact', to: 'projects#contact'
  get 'projects', to: 'projects#projects'

  root 'projects#index'
end
