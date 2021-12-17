Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, skip: [:passwords,], controllers:{
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  
  scope module: :user do
    root :to => 'homes#top'
    get '/about' => 'homes#about', as:'about'
    
    get 'search/users' => 'searches#user_index'
    get 'search/posts' => 'searches#post_index'
    
    resources :users

    resources :posts do
      get 'map' => 'posts#map', on: :collection
      resource :thanks, only:[:create, :destroy]
      resources :post_comments, only:[:create, :destroy]
      
    end
  
  end
  
end
