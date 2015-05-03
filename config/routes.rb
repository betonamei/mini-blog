Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users , :skip => [:sessions, :passwords, :registrations]
  as :user do
    get   'signin' => 'devise/sessions#new', :as => :new_user_session

    post  'signin' => 'devise/sessions#create', :as => :user_session
    
    #destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
    match 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session, :via => Devise.mappings[:user].sign_out_via
    
    #user_password POST   /users/password(.:format)      devise/passwords#create
    get   'user_password' => 'devise/passwords#create', :as => :user_password
    
    #new_user_password GET    /users/password/new(.:format)  devise/passwords#new
    get   'new_user_password' => 'devise/passwords#new', :as => :new_user_password 
    
    #edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
    get   'edit_password' => 'devise/passwords#edit', :as => :edit_user_password

    #PATCH  /users/password(.:format)      devise/passwords#update
    patch '/users/password(.:format)' => 'devise/passwords#update' 

    #PUT    /users/password(.:format)      devise/passwords#update
    put   '/users/password(.:format)' => 'devise/passwords#update'
    
    #cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
    get   'cancel_user_registration' => 'devise/registrations#cancel', :as => :cancel_user_registration
    
    #user_registration POST   /users(.:format)               devise/registrations#create
    post  'user_registration' => 'devise/registrations#create'

    #new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
    get   'sign_up' => 'devise/registrations#new', :as => :new_user_registration
    
    #edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
    get   'edit_user_registration' => 'devise/registrations#edit', :as => :edit_user_registration

    #PATCH  /users(.:format)               devise/registrations#update
    patch '/users(.:format)' => 'devise/registrations#update'
    
    #PUT    /users(.:format)               devise/registrations#update
    put   'users(.:format)' => 'devise/registrations#update'
    
    #DELETE /users(.:format)               devise/registrations#destroy
    delete '/users(.:format)' => 'devise/registrations#destroy'
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
