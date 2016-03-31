Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

#  get "/", to: "posts#index"
  root to: "posts#index"
  get "posts/new", to: "posts#new", as: "posts_new"
  post "posts", to: "posts#create"

  get "posts/:id/edit", to: "posts#edit", as: "edit_post"
  put "posts/:id", to: "posts#update", as: "post"
  get "posts/:id", to: "posts#show"
  delete "posts/:id", to: "posts#destroy"

  post "posts/:id/comments", to: "comments#create", as: "post_comments"
  get "tagged/:name", to: "tags#index", as: "tagged_posts"

  # get "users/:uid/posts/:pid/comments/:cid"
  # post_comment_path(user.id, post.id, comment.id)

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
