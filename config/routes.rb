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
    get 'search/map' => 'searches#post_map'
    
    resources :users do
      get 'bookmarks' => 'users#bookmark', on: :collection
    end

    resources :posts do
      resource :thanks, only:[:create, :destroy]
      resource :bookmarks, only:[:create, :destroy]
      resources :post_comments, only:[:create, :destroy]
      
    end
  
  end
  
end
