Rails.application.routes.draw do
 resources :books do
 	collection do
 	end
 	member do
 		post :update_description
 		get :edit_description
 	end
 end



 namespace "api" do
 	namespace "v1" do
 	resources :books do
 		member do
	 		post :update_description
	 		get :edit_description
	 	end
	 end
	end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
