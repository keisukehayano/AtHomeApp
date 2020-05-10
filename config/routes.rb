Rails.application.routes.draw do
  root    'static_pages#home'
  post    '/login',   to: 'session#create'
  delete  '/logout',  to: 'session#destroy'
  get     '/help',    to: 'static_pages#help'
  get     '/about',   to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'
  get     '/signup',  to: 'users#new'
  get     '/signin',  to: 'users#login'
  get     '/mypage',  to: 'users#me'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
