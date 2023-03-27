Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :pallet_hists, only: :destroy
  resources :posts do
  	resources :comments
  end

  root 'posts#index'
end