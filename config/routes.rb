Rails.application.routes.draw do
  root to: "home#index"

  get "/sign_up", to:"registrations#new"
  post "/sign_up", to:"registrations#create"
  
  get "/sign_in", to:"sessions#new"
  post "/sign_in", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
  
  get "/passwords", to:"passwords#edit", as: :edit_password
  patch "/passwords", to:"passwords#update"
  
  get "/posts", to:"posts#new"
  post "/posts", to:"posts#create"
  get "/posts/:id", to:"posts#show"
  delete "/posts_delete", to:"posts#destroy"

  get "/edit_post", to: "update_posts#edit"
  patch "/edit_post", to: "update_posts#update"
end
