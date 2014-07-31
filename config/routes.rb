Omrails::Application.routes.draw do
  


  get "profile/place"
  get "profile/bio"
  get "users/show"


resources :posts do
  member do
      put :upvote
    end
  resources :comments do
    member do
      put :upvote
    end
    member do 
      get :unansweredquestions
    end
  end 
end
      
resources :comments do
    member do
      put :upvote
    end
    resources :questions do
    member do
      put :upvote
    end
  end
end 




resources :posts do
  member do
      put :upvote
    end
  resources :links do
    member do
      put :upvote
    end
  end
end 

resources :questions do
  member do
      put :upvote
    end
  resources :answers do
    member do
      put :upvote
    end
  end 
end









devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, 
controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: :registrations, sessions: "sessions"}
  
  
  root to: 'posts#index'
  match '/about', to: 'pages#about',  via:'get'
  match '/contact', to: 'pages#contact',  via:'get'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'users/:id', to: 'users#show', as: :user
  get 'users/:id/upvoted', to: 'users#upvoted', as: :upvoted
  get 'users/:id/userquestions', to: 'users#questions', as: :userquestions
  get 'users/:id/userinterviews', to: 'users#interviews', as: :userinterviews
  get 'posts/:id/topquestions', to: 'posts#showtopquestion', as: :topquestions
  get 'posts/:id/newquestions', to: 'posts#shownewquestion', as: :newquestions
  get 'top', to: 'posts#top', as: :top

   devise_scope :user do
    get "/info" => "registrations#info"
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
