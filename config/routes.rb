Rails.application.routes.draw do
root to: 'homes#top'
  get '/about' => 'homes#about'


#以下は顧客
  scope module: 'public' do


    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
   }

    resources :customers, only: [:show, :edit, :update] do
      get 'confirm'
      patch 'withdraw'
    end


    resources :cart_products, only: [:index, :update, :destroy, :create] do
      delete 'all_destroy'
    end


    resources :orders, only: [:index, :show, :create, :new] do
      post 'confirm'
      get 'complete'
    end

    resources :products, only: [:index, :show]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end



#以下は管理者
  get '/admin' => 'admin/homes#top'
  devise_for :admin, skip: [:passwords], :controllers => {
    :sessions => 'admin/sessions'
  }

  namespace :admin do

    resources :products, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:show, :update]

    patch 'order_products' => 'order_products#update'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
