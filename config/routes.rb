Rails.application.routes.draw do

  root 'homes#top'
  devise_for :dog_owners
  #devise画面をカスタマイズしないため、ここからコメントアウト
  #   controllers: {
  #   sessions: 'dog_owners/sessions#new',
  #   passwords: 'dog_owners/registrations#passwords',
  #   registrations: 'dog_owners/registrations#new'
  #}
  #ここまでコメントアウト
  devise_for :administrators
  #devise画面をカスタマイズしないため、ここからコメントアウト
  #  controllers: {
  #  sessions: 'administrators/sessions',
  #  passwords: 'administrators/passwords',
  #  registrations: 'administrators/registrations'
  #}
  #ここまでコメントアウト

    namespace :admin do
      resources :dog_owners
      resources :dog_categories, only: [:index, :create, :edit, :update, :destroy]
    end

      get '/about' => 'homes#about'
      get '/dog_owners/withdrawal' => 'dog_owners#withdrawal', as: 'withdrawal_dog_owner'
      resources :dog_owners, only: [:show, :edit, :update, :destroy]
      resources :dogs
      resources :posts, only: [:new, :create, :index, :show, :destroy] do
        resource :cognitions, only: [:create, :destroy]
        resources :answers, only: [:create, :destroy] do
          resource :references, only: [:create, :destroy]
        end
      end
end