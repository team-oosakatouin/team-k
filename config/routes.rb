Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :customers

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

root to: "public/homes#top"
namespace :public do
  get "home/about"=>"homes#about", as: "about"
  #配送先
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  # 注文
  post "orders/confirm" => "orders#confirm"
  get "orders/complete" => "orders#complete"
  resources :orders, only: [:new, :create, :index, :show]
  ##会員
  get "customers/quit" => "customers#quit"
  patch "customers/withdraw" => "customers#withdraw"
  resources :customers, only: [:edit, :show, :update]
  #カート内商品
  delete "cart_items/destroy_all" => "cart_items#destroy_all"
  resources :cart_items, only: [:index, :update, :create, :destroy, :show]
  #商品
  resources :items, only: [:index, :show]
end





# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root :to =>"homes#top"
   resources :customers, only: [:index, :show, :edit, :update]
   resources :items, only: [:index, :show, :edit, :update, :create, :new]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
