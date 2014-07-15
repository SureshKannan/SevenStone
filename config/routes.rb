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

  controller :login do
    get "login", to: "login#index"
    get "login/index"
    post "login/index", to: "login#signin"
    get "login"

    get "logins", to: "login#index"
    post "logins", to: "login#signin"
  end
  controller :role do
    get "roles", to: "roles#index"
    get "roles/index"
  end

  controller :department do
    get "department/list"
    get "department/index"
    get "department/create"
    get "department/update"
    get "department/destroy"
  end
  controller :status do
    get "status/list"
    get "status/index"
    get "status/create"
    get "status/update"
    get "status/destroy"
  end

  controller :priority do
    get "priority/list"
    get "priority/index"
    get "priority/create"
    get "priority/update"
    get "priority/destroy"
  end

  controller :category do
    get "category/list"
    get "category/index"
    get "category/create"
    get "category/update"
    get "category/destroy"
  end
end
