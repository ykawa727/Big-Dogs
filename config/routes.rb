Rails.application.routes.draw do

  root 'homes#top'
  devise_for :dog_owners, controllers: {
    sessions: 'dog_owners/sessions',
    passwords: 'dog_owners/passwords',
    registrations: 'dog_owners/registrations'
  }
  devise_for :administrators, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

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
