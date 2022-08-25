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
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :cart_items, only: [:index, :update, :create, :destroy]
  resources :customers, only: [:edit, :show, :update, :withdraw]
  resources :items, only: [:index, :show]
  # 追加記載
  get "customers/quit" => "customers#quit"
  delete "cart_items/destroy_all" => "cart_items#destroy_all"
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
