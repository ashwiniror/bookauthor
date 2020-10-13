Rails.application.routes.draw do
  root 'books#index'
 
 	 resources :books
  	 resources :authors

  	namespace :api do 
  		namespace :v1 do 
  		resources :authors
    end
	 end
end 	 	
  	 