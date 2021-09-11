Rails.application.routes.draw do
  
  root to: 'users/homes#top'
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  namespace :admin do
    
    resources :posts, only: [:index, :edit, :update, :destroy]
    
    resources :plans, only: [:index, :edit, :update, :destroy]
    
    resources :users, only: [:index, :show]
    
    get '/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    get '/withdraw' => 'users#withdraw'
    patch '/withdraw' => 'users#withdraw'
    
  end

  namespace :users do
    
    get '/about' => 'homes#about'
    get '/my_page' => 'users#show'
    patch '/my_page' => 'users#update'
    delete '/users/sign_out' => 'sessions#destroy'
    
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    
    resources :plans, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    
    resources :users, only: [:show, :edit, :update]
    
    get '/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    get '/withdraw' => 'users#withdraw'
    patch '/withdraw' => 'users#withdraw' 
    
  end
end
