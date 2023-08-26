Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :index

      resources :posts, only: :index

      resources :likes, only: [:create, :destroy] do
        collection do
          get :most_liked_days
          get :like_streaks
        end
      end
    end
  end
end
