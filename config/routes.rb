Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, except: [:new]
  resources :homes, except: [:index,:create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'about'
    end
  end
  resources :users, only: [:index, :edit, :show, :update]
end