Rails.application.routes.draw do
  devise_for :recruiters, path: 'hires', controllers: { sessions: "recruiters/sessions" }
  devise_for :users, path: 'members', controllers: { sessions: "users/sessions" }
  
  resources :jobs
  
  root to: "home#hero"
end
