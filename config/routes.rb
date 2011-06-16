Instavibe::Application.routes.draw do
  scope "/api", :defaults => { :format => :json } do
    resources :users, :except => [:new, :edit] do
      resources :plans, :except => [:new, :edit] do
        resources :checkins, :only => [:create]
      end
    end
    
    # resources :spots
  end
end
