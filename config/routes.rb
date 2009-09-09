ActionController::Routing::Routes.draw do |map|
  
  map.namespace :provider do |provider|
    provider.login '/', :controller => :service_provider_sessions, :action => :new 
    provider.logout '/logout', :controller => :service_provider_sessions, :action => :destroy
    provider.registration '/registration', :controller => :service_providers, :action => :new
    provider.resource :service_provider_sessions, :only => [:new, :create, :destroy]
    provider.resource :service_providers, :only => [:show, :edit, :update, :new, :create]
  end
  map.root :provider_login

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
