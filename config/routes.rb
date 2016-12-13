Rails.application.routes.draw do
  resources :messages, only: [:create, :destroy, :index]
end
