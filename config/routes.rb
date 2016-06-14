Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get '/search', to: "search#index"
  get '/stores/:id', to: "search#show", as: :store

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items, except: [:new, :edit, :update]
    end
  end
end
