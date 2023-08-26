Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :likes, only: [] do
        get :most_liked_days, on: :collection
        get :like_streaks, on: :collection
      end

      resources :posts, only: :index
    end
  end
end
