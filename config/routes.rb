Rails.application.routes.draw do
  devise_for :users, path: 'members', controllers: { sessions: "users/sessions", omniauth_callbacks: 'users/omniauth_callbacks', passwords: "users/passwords" }
  
  resources :jobs
  
  root to: "home#hero"
end
