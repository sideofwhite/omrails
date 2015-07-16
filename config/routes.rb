Omrails::Application.routes.draw do
  


  
  
 post '/tinymce_assets' => 'tinymce_assets#create'

  get "profile/place"
  get "profile/bio"
  get "users/show"


resources :posts, :path => "news" do
   member do
    post "sort" => "comments#sort"
  end
   member do
    get 'question_form'
  end
   collection { post :sort }
  member do
      put :upvote
    end
    resources :events
  resources :comments, :path => "q" do
    member do
      put :upvote
      get :tag
    end
    member do 
      get :unansweredquestions
    end
  end 
  resources :pictures
end
      
resources :comments, :path => "q" do
    member do
      put :upvote
    end
    resources :questions, :path => "a" do
    member do
      put :upvote
    end
  end
end 

 resources :events do
 resources :articles
end


resources :questions, :path => "a" do
  member do
      put :upvote
    end
   resources :links do
    member do
      put :upvote
    end
  end
end









devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :omniauth_providers => [:twitter],
controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: :registrations, sessions: "sessions"}
   
  
  root to: 'posts#index'
  match '/about', to: 'pages#about',  via:'get'
  match '/contact', to: 'pages#contact',  via:'get'
  match '/guidelines', to: 'pages#guidelines',  via:'get'
  match '/tos', to: 'pages#tos',  via:'get'
  match '/browser', to: 'pages#browser',  via:'get'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'tags/:tag', to: 'posts#show'
  get 'users/:id', to: 'users#show', as: :user
  get 'users/:id/upvoted', to: 'users#upvoted', as: :upvoted
  get 'users/:id/userquestions', to: 'users#questions', as: :userquestions
  get 'users/:id/notifications', to: 'users#notifications', as: :notifications 
  get 'users/:id/allnotifications', to: 'users#allnotifications', as: :allnotifications 
  post 'users/read_all_notifications', to: 'users#read_all_notification', as: :read_all_notifications 
  get 'users/:id/upvotes', to: 'users#upvotes', as: :upvotes
  get 'users/:id/allanswers', to: 'users#allanswers', as: :allanswers
  get 'users/:id/allcomments', to: 'users#allcomments', as: :allcomments
  get 'news/:id/topquestions', to: 'posts#showtopquestion', as: :topquestions
  get 'news/:id/answersmore', to: 'posts#showanswersmore', as: :answersmore
  get 'news/:id/ordered', to: 'posts#ordered', as: :ordered
  get 'news/:id/new_posts', to: 'posts#new_posts', as: :new_posts
  get 'comments/:id/unpublished', to: 'comments#unpublished', as: :unpublished
  get '/admin', to: 'posts#admin', as: :admin
  get '/admin/questions', to: 'pages#admin_questions', as: :adminquestions
  get '/admin/answers', to: 'pages#admin_answers', as: :adminanswers
  get '/admin/replies', to: 'pages#admin_replies', as: :adminreplies
  get '/following', to: 'pages#following', as: :following
  get 'top', to: 'posts#top', as: :top
  get  '/image_form', to: 'posts#image_form', as: :image_form
  get  '/search-news', to: 'posts#search', as: :search


   devise_scope :user do
    get "/info" => "registrations#info"
  end

  get '*path' => redirect('/')


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
