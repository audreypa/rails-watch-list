Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, except: %i[destroy edit] do
    resources :bookmarks, except: %i[update create]
  end
  resources :bookmarks, only: :destroy
  # Defines the root path route ("/")
end
