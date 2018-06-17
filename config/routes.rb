Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "fruits#index"
  # Routes for the Fruit resource:
  # CREATE
  get "/fruits/new", :controller => "fruits", :action => "new"
  post "/create_fruit", :controller => "fruits", :action => "create"

  # READ
  get "/fruits", :controller => "fruits", :action => "index"
  get "/fruits/:id", :controller => "fruits", :action => "show"

  # UPDATE
  get "/fruits/:id/edit", :controller => "fruits", :action => "edit"
  post "/update_fruit/:id", :controller => "fruits", :action => "update"

  # DELETE
  get "/delete_fruit/:id", :controller => "fruits", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
