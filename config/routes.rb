Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, only: %i[index show create update destroy]
      resources :meals, only: %i[index] do
        post '/foods/:id', to: 'meals/foods#create'
        get '/foods', to: 'meals#show'
      end
    end
  end
end
