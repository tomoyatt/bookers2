Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'books/index'
  get 'books/show'
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about",as: 'about'
end
