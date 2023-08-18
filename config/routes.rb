Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    
    resources :items, only: [:index, :show]
    
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get 'confirm_withdraw'
        patch 'withdraw'
      end
    end
    
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
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
end
