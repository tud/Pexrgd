Pexrgd::Application.routes.draw do

  root :to => "site#index"

  get "site/index"

  scope "(/:locale)", :locale => /en|it/ do
    resources :drawings do
      get :search, :on => :collection
      get :jqgrid, :on => :collection
      get :autocomplete_drawing_number, :on => :collection
      get :autocomplete_drawing_rev, :on => :collection
      get :autocomplete_drawing_format, :on => :collection
      get :autocomplete_drawing_descr, :on => :collection
      get :autocomplete_drawing_designer, :on => :collection
    end
  end
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
#== Route Map
# Generated on 27 Jun 2011 15:02
#
#                             site_index GET    /site/index(.:format)                                       {:controller=>"site", :action=>"index"}
#                        search_drawings GET    (/:locale)/drawings/search(.:format)                        {:locale=>/en|it/, :action=>"search", :controller=>"drawings"}
#                        jqgrid_drawings GET    (/:locale)/drawings/jqgrid(.:format)                        {:locale=>/en|it/, :action=>"jqgrid", :controller=>"drawings"}
#   autocomplete_drawing_number_drawings GET    (/:locale)/drawings/autocomplete_drawing_number(.:format)   {:locale=>/en|it/, :action=>"autocomplete_drawing_number", :controller=>"drawings"}
#      autocomplete_drawing_rev_drawings GET    (/:locale)/drawings/autocomplete_drawing_rev(.:format)      {:locale=>/en|it/, :action=>"autocomplete_drawing_rev", :controller=>"drawings"}
#   autocomplete_drawing_format_drawings GET    (/:locale)/drawings/autocomplete_drawing_format(.:format)   {:locale=>/en|it/, :action=>"autocomplete_drawing_format", :controller=>"drawings"}
#    autocomplete_drawing_descr_drawings GET    (/:locale)/drawings/autocomplete_drawing_descr(.:format)    {:locale=>/en|it/, :action=>"autocomplete_drawing_descr", :controller=>"drawings"}
# autocomplete_drawing_designer_drawings GET    (/:locale)/drawings/autocomplete_drawing_designer(.:format) {:locale=>/en|it/, :action=>"autocomplete_drawing_designer", :controller=>"drawings"}
#                               drawings GET    (/:locale)/drawings(.:format)                               {:locale=>/en|it/, :action=>"index", :controller=>"drawings"}
#                                        POST   (/:locale)/drawings(.:format)                               {:locale=>/en|it/, :action=>"create", :controller=>"drawings"}
#                            new_drawing GET    (/:locale)/drawings/new(.:format)                           {:locale=>/en|it/, :action=>"new", :controller=>"drawings"}
#                           edit_drawing GET    (/:locale)/drawings/:id/edit(.:format)                      {:locale=>/en|it/, :action=>"edit", :controller=>"drawings"}
#                                drawing GET    (/:locale)/drawings/:id(.:format)                           {:locale=>/en|it/, :action=>"show", :controller=>"drawings"}
#                                        PUT    (/:locale)/drawings/:id(.:format)                           {:locale=>/en|it/, :action=>"update", :controller=>"drawings"}
#                                        DELETE (/:locale)/drawings/:id(.:format)                           {:locale=>/en|it/, :action=>"destroy", :controller=>"drawings"}
