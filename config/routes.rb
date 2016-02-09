Rails.application.routes.draw do
  root 'users#index'
  post '/users/:id/sharecontacts' => 'users#share_contacts', as: :share_contacts
  get '/users/:id/contacts' => 'users#mes_contacts', as: 'user_contacts'
  get '/mailgroupe' => 'users#mailgroupe', as: 'mailgroupe'
  post 'users/mailgroupe' => 'users#postmail', as: "postmail"
  
  devise_for :users
  devise_for :contacts, controllers: { 
    registrations: 'contacts/registrations',
    sessions: 'contacts/sessions'
  }
  as :contact do
    get '/users/:id/contacts/new' => 'contacts/registrations#new', as: :new_contact
    post '/users/:id/contacts' => 'contacts/registrations#create', as: :create_contact
    
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users
  resources :contacts do
    resources :notes
  end
  
  # resources :contacts
  # post '/users/:id/contacts/new' => 'contacts#create'
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