Rails.application.routes.draw do
  get 'user', to: redirect('/user/sign_up')
  # root 'welcome#index'
  root 'products#index'
  # mount RuCaptcha::Engine => "/rucaptcha"
  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :account do
    resources :orders
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  # devise_for :users

  devise_for :user, controllers: {
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :orders do
      post :cancel
      post :ship
      post :shipped
      post :return
    end
    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end
  end

  resources :cart_items
end
