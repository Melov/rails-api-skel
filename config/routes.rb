Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/v1" do
    scope "/user" do
      post 'login', to: 'authentication#login'
      post 'register', to: 'authentication#register'
      post 'logout', to: 'authentication#logout'
      get 'sessions', to: 'authentication#sessions'
    end
  end
  root 'main#index'
end
