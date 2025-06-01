require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :products
  
  resource :cart do
    get :list_products
    post :add_product
    patch :update_quantity
    delete :remove_product
  end
  get "up" => "rails/health#show", as: :rails_health_check
  root "rails/health#show"
end

