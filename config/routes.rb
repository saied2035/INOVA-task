Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
 
  get 'top_stories', to: 'stories#top_stories'
  resources :users, only: [] do
    resources :stories, only: [:index, :create]
  end
  
  resources :stories, only: [] do
    resources :reviews, only: [:create]
  end  

  # Defines the root path route ("/")
  # root "posts#index"
end