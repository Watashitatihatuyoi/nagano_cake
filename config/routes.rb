Rails.application.routes.draw do

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all', to: 'cart_items#destroy_all'
      end
    end

    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'check'
        get 'complete'
      end
    end

    resources :addresses, except: [:new, :show]

  end

  namespace :admin do
    get '/' => 'homes#top'

    resources :items, except: [:destroy]

    resources :genres, except: [:destroy, :show, :new]

    resources :customers, except: [:destroy, :create, :new]

    resources :orders, only: [:show, :update] do
      resources :order_items, only: [:update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

end
