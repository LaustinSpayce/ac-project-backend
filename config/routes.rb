Rails.application.routes.draw do
  resources :islands
  mount_graphql_devise_for 'User', at: 'auth'
  post '/graphql', to: 'graphql#execute'

  resources :bugs
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount GraphiQL::Rails::Engine,
          at: '/graphiql', graphql_path: 'graphql#execute'
  end
end
