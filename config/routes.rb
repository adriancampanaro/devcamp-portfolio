Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'tester123', to: 'portfolios#test123'
  
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  #get 'pages/home'  
  get 'about', to: 'pages#about'
  #get 'aboutus', to: 'pages#about'
  get 'contact', to: 'pages#contact'

    resources :blogs do
      member do
        get :toggle_status
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  # application home page

end
