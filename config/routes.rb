Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  root 'pages#home'
  resources :posts, only: [:index]
  resources :categories, only: [:index, :show] do
    resources :feeds, only: [:index], constraints: {format: :xml}
  end

  get 'robots', to: 'pages#robots', as: :robots
  resources :feeds, only: [:index], constraints: {format: :xml}

  # Logging in/out
  get 'login',  to: 'user_sessions#new',     as: :login
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy', as: :logout

  namespace :admin do
    root 'posts#index'
    resources :posts, except: [:show]
    resources :categories, except: [:show]
    resources :users, except: [:show]
    resources :uploads, only: [:index, :show, :update, :create]
    resources :settings, only: [:index, :edit, :update]
    mount Idioma::Engine => "/idioma"
  end

  get "/:id", to: "posts#show", as: :post
  get '/posts/:id', to: redirect('/%{id}')
end
