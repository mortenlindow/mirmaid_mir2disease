ActionController::Routing::Routes.draw do |map|

  map.resources :m2d_diseases, :only => [:index,:show] do |m2d|
    m2d.resources :m2d_disease_links, :only => [:index]
  end
  
  map.resources :m2d_disease_links, :only => [:index,:show] do |m2dl|
    m2dl.resource :m2d_disease, :only => [:show]
    m2dl.resource :mature, :only => [:show]
  end
  
end
