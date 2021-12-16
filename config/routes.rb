Rails.application.routes.draw do
  root 'login#login'

  # post
  get '/posts', to: 'posts#index'

  resources :users do
    collection do

      get :new_user, to: "users#new"
      post :new_user
    end
    member do
      get :edit
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
