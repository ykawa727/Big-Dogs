Rails.application.routes.draw do

  root 'homes#top'

  devise_for :dog_owners

  devise_for :administrators

    namespace :admin do
      resources :dog_owners, only: [:index, :show, :edit, :update]
      resources :dog_categories, only: [:index, :create, :edit, :update, :destroy]
    end

      get '/about' => 'homes#about'
      get '/dog_owners/withdrawal' => 'dog_owners#withdrawal', as: 'withdrawal_dog_owner'
      resources :dog_owners, only: [:show, :edit, :update, :destroy]
      resources :dogs
      resources :posts, only: [:new, :create, :index, :show, :destroy] do
        resource :cognitions, only: [:create, :destroy]
        resources :answers, only: [:create, :destroy] do
          resource :answer_favorites, only: [:create, :destroy]
        end
      end
      get 'search' => 'posts#search'
      get 'dog_search' => 'posts#dog_search'
end