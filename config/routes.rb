Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'tasks#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products



  # Example resource route with options:
     resources :tasks, :tasktypes do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
      collection do
        get 'search'
        get 'name_search'
       end
     end

   resources :tasks do
     member do
       get 'switch'
       put 'switch'
     end
   end

   get ':task_status' => 'tasks#index', as: 'tasks_filter'
   get 'tasks/type/:tasktype_id' => 'tasks#index', as: 'tasks_type_filter'
   get '/pending' => 'tasks#pending'
   get '/completed' => 'tasks#completed'
   post '/pending' => 'tasks#pending'
   post '/completed' => 'tasks#completed'
   post '/all' => 'tasks#index'
   get '/all' => 'tasks#index', as: 'all_tasks'
   post 'tasks/:id/switch' => 'tasks#switch', as: :switch
   post 'tasktypes/:id/edit' => 'tasktypes#edit', as: :edit




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
