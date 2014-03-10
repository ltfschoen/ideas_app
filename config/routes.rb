IdeasApp::Application.routes.draw do
  resources :comments

  resources :weblinks

  resources :posts

  #mount Dashing::Engine, at: Dashing.config.engine_path
  get "static_pages/home"
  get "static_pages/about_us"
  get "static_pages/contact_us"
  get "static_pages/help"

  resources :categories

  # resources :user_mailer do
  # 	collection do
  # 		# post :welcome_email
  # 		get :feedback_message
  # 	end
  # end

  #resources :enquiries 
  # resources :enquiry_mail

  resources :ideas do
  	collection do
  		post :details
  		post :results
  		post :results2
  		get :ga # google analytics
  		post :mailer
  	end
  end

  devise_for :users

  root 'ideas#index'

end

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