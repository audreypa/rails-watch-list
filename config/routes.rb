Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, except: %i[destroy] do
    resources :bookmarks do
      member do
        put 'like', to: 'posts#upvote'
        put 'dislike', to: 'posts#downvote'
      end
      resources :reviews, only: %i[new create]
    end
  end
  resources :bookmarks, only: :destroy
  # Defines the root path route ("/")
  root to: '/home'
end
