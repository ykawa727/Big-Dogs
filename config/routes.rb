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
      resources :dog_categories
    end

      get '/about' => 'homes#about'
      get '/dog_owners/withdrawal' => 'dog_owners#withdrawal'
      patch '/dog_owners/withdrawal' =>'dog_owners#dest'
      resources :dog_owners
      resources :dogs
      resources :posts
end
