SampleApp::Application.routes.draw do
	### STATIC PAGES
	root 'static_pages#home'
	# get "static_pages/help"
	match '/help', to: 'static_pages#help', via: 'get'
	match '/about', to: 'static_pages#about', via: 'get'
	match '/contact', to: 'static_pages#contact', via: 'get'

	### USER PAGES
	resources :users
	# provides:				Action	Named route
	# Get /users			index		users_path
	# Post /users			create	users_path
	# Get /users/new		new		new_user_path
	# Get /users/1			show		user_path(user)
	# Patch /users/1		update	user_path(user)
	# Delete /users/1		destroy	user_path(user)
	# Get /users/1/edit	edit		edit_user_path(user)

	#get "users/new" # Replaced by resources :users
	match '/signup', to: 'users#new', via: 'get'


	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	# root 'welcome#index'

	# Example of regular route:
	#	 get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#	 get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#	 resources :products

	# Example resource route with options:
	#	 resources :products do
	#		 member do
	#			 get 'short'
	#			 post 'toggle'
	#		 end
	#
	#		 collection do
	#			 get 'sold'
	#		 end
	#	 end

	# Example resource route with sub-resources:
	#	 resources :products do
	#		 resources :comments, :sales
	#		 resource :seller
	#	 end

	# Example resource route with more complex sub-resources:
	#	 resources :products do
	#		 resources :comments
	#		 resources :sales do
	#			 get 'recent', on: :collection
	#		 end
	#	 end

	# Example resource route with concerns:
	#	 concern :toggleable do
	#		 post 'toggle'
	#	 end
	#	 resources :posts, concerns: :toggleable
	#	 resources :photos, concerns: :toggleable

	# Example resource route within a namespace:
	#	 namespace :admin do
	#		 # Directs /admin/products/* to Admin::ProductsController
	#		 # (app/controllers/admin/products_controller.rb)
	#		 resources :products
	#	 end
end
