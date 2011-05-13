Photos::Application.routes.draw do
  resources :albums do 
    resources :photos
  end
  
  root :to => "albums#index"
end
