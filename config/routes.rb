Rails.application.routes.draw do
  # get 'welcome/index'
  # root 'welcome#index'
  root 'products#index'

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
  end
end
