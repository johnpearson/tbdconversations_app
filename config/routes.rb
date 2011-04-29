TbdconversationsApp::Application.routes.draw do

  devise_for :users
  resources :users
  resources :posts
  
  match '/about'    => 'pages#about'
  match '/contact'  => 'pages#contact'
  
  root :to => 'pages#home'


end
