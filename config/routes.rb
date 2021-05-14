Rails.application.routes.draw do
	  resources :posts do
	  	resources :comments
	  end
	  draw("https://agile-refuge-21209.herokuapp.com/posts")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
