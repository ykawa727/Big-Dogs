Rails.application.routes.draw do
  devise_for :administrators
  devise_for :dog_owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
