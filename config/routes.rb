Registrar::Application.routes.draw do

  get "directory/index"

  resources :invites


  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  post '/user_courses/update_progress', to: 'user_courses#update_progress', as: 'update_progress'


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  # get 'user/new:token' 

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post '/user_courses/update_progress', to: 'user_courses#update_progress', as: 'update_progress'

  resources :sessions
  resources :users
  resources :courses

  match '/prework' => 'prework#index' 
  match 'preworkintro' => 'courses#intro'
  match '/users/:id/update_codeschool' => 'users#update_codeschool'
  match '/users/:id/update_treehouse' => 'users#update_treehouse'
  match '/users/:id/prework' => 'prework#index', as: 'user_prework'
  match '/signup/:token' => 'users#new'

  match ':events/:id' => 'events#show'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'sessions#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
