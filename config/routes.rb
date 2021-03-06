Rails.application.routes.draw do
  get 'hello/index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :volunteers
  resources :opportunities
  resources :assignments, except: [:new]

  resource :assignment do
    get :signup, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'opportunities#index'
end
