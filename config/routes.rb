SevenStone::Application.routes.draw do
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
  
  root "roles#index"
  
  controller :login do
    get  "login", to: "login#index"
    get  "login/index", to: "login#index"
    post "login/index", to: "login#signin" 
    post "logins", to: "login#signin"
  end
  controller :role do
    get  "roles", to: "roles#index"
    get  "roles/index"
    post "roles", to: "roles#create"
    post "roles/index"
    get  "roles/new", as: "new_role"
    post "roles/delete",to: "roles#delete"
    get 'roles/:id/edit' => 'roles#edit', as: :role
    post 'roles/:id/edit' => 'roles#update'
    patch 'roles/:id/edit' => 'roles#update'
  end
  controller :group do
    get  "groups", to: "groups#index"
    get  "groups/index"
    post "groups", to: "groups#create"
    post "groups/index"
    get  "groups/new", as: "new_group"
    post "groups/delete",to: "groups#delete"
    get 'groups/:id/edit' => 'groups#edit', as: :group
    post 'groups/:id/edit' => 'groups#update'
    patch 'groups/:id/edit' => 'groups#update'
  end
  controller :user do
    get  "users", to: "users#index"
    get  "users/index"
    post "users", to: "users#create"
    post "users/index"
    get  "users/new", as: "new_user"
    post "users/delete",to: "users#delete"
    get 'users/:id/edit' => 'users#edit', as: :user
    post 'users/:id/edit' => 'users#update'
    patch 'users/:id/edit' => 'users#update'
  end
end
