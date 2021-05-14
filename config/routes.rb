Rails.application.routes.draw do
	direct :homepage do
  		"https://agile-refuge-21209.herokuapp.com/posts"
	end
	  resources :posts do
	  	resources :comments
	  end
	  draw(:admin)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
