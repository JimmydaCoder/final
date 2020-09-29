Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :posts do   
    resources :likes
  end


  root to: 'posts#index'

  get '/post/like/:id', to: 'post#mark'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
