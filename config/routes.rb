Rails.application.routes.draw do
  resources :boards
 devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'pages/home'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
