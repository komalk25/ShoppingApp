Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :sellers

  root 'products#index'
  resources :seller do
    resources :products
  end

  resources :products
  resources :users
  resources :carts
  resources :cart_items

  resources :orders
  resources :order_items
 
  
  post 'carts/:id/reduce' => 'carts#reduce_quantity', as: 'cart_reduce'
  get '/users/:id/profile' => 'users#profile', as: 'user_profile'
end
