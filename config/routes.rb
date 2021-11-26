Rails.application.routes.draw do
  resources :applies
  resources :jobs
  devise_for :admins
  devise_for :workers
  devise_for :headhunters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "jobs#index"
  resources :headhunters
  resources :workers
  get '/applies/worker/:id', to: 'workers#applies', as: 'applies_worker'
end
