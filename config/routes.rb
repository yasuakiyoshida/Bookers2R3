Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy] # commentは一人のユーザーが複数投稿できるため複数系『resources』
  end
  resources :homes, path: 'home', except: [:index, :create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'about'
    end
  end
  resources :users, only: [:index, :edit, :show, :update]
end
