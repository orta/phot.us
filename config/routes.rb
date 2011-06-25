Photos::Application.routes.draw do
  constraints(Subdomain) do
    resources :albums do 
      resources :photos
    end

    root :to => "albums#index"  
  end
 root :to => "albums#index"  

end
