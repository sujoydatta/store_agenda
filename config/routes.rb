Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :stores, only: [:index, :update] do
      get 'check_price', on: :collection, to: 'stores#check_price'
    end
  end
end
