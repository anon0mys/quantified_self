Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :foods, only: %i[index show create update destroy]
      resources :meals, only: %i[index] do
        post '/foods/:id', to: 'meals/foods#create'
        get '/foods', to: 'meals#show'
        delete '/foods/:id', to: 'meals/foods#destroy'
      end
    end
  end
end
