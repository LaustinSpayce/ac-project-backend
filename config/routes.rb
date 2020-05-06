Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  mount_graphql_devise_for 'User', at: 'api/auth'
  mount_graphql_devise_for 'User', at: 'auth'
  resources :bugs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount GraphiQL::Rails::Engine,
          at: '/graphiql', graphql_path: 'graphql#execute'
  end
  post '/graphql', to: 'graphql#execute'
end
