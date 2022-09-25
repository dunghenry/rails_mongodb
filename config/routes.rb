Rails.application.routes.draw do
  get 'users', action: :getUsers, controller: :users
  post 'users', action: :addUser, controller: :users
  get 'users/:id', action: :showUser, controller: :users
  put "/users/:id", action: :updateUser, controller: :users
  delete "/users/:id", action: :deleteUser, controller: :users
  root "pages#index"
end
