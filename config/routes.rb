Rails.application.routes.draw do
  root 'login#login'
 # posts
  resources :posts do
      get :new_post, to: "posts#new"
      post :new_post
     
    end

 # users
  resources :users do
    collection do

      get :new_user, to: "users#new"
      post :new_user
      get :profile
    end
    member do
      get :edit
    end
  end


  # login
  get '/login', to: 'login#login'
  post '/login', to: 'login#actionLogin'
  get '/logout', to: 'login#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
