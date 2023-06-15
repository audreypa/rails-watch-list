Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/new'
  get 'bookmarks/edit'
  get 'bookmarks/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, except: %i[destroy] do
    resources :bookmarks, except: :destroy
  end
  resources :bookmarks, only: :destroy
  # Defines the root path route ("/")
  root to: 'lists#home'
end
