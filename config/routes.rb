Rails.application.routes.draw do
  devise_for :installs
  devise_for :users

  root 'posts#index'
end
