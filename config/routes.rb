Rails.application.routes.draw do
  namespace :admin do
    resources :statuses

    root 'statuses#index'
  end

  root 'index#index'
end
