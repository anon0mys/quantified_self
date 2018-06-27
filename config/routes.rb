Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, only: %i[index show create update destroy]
      resources :meals, only: %i[index] do
        post '/foods/:id', to: 'meals/foods#create'
      end
    end
  end
end
