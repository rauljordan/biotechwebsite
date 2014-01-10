Biotech::Application.routes.draw do
  get "articles/index"
  get "users/new"
  get "users/create"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'welcome/about' => "welcome#about", :as => "welcome/about"
  get 'welcome/contact' => "welcome#contact", :as => "welcome/contact"
  get 'welcome/faq' => "welcome#faq", :as => "welcome/faq"
  get 'welcome/features' => "welcome#features", :as => "welcome/features"

  get 'welcome/service' => "welcome#service", :as => "welcome/service"
  get 'welcome/pricing' => "welcome#pricing", :as => "welcome/pricing"
  get 'welcome/benefits' => "welcome#benefits", :as => "welcome/benefits"

  # Articles
  get 'articles/show' => "articles#show", :as => "articles/show"

   # Sessions Users
  get'logout_user' => "sessions#destroy", :as => "logout_user"
  post "login_user" => "sessions#new", :as => "login_user"

  # Users
  get "signup" => "users#new", :as => "signup"

  resources :users
  resources :sessions


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
