Rails.application.routes.draw do
  resources :posts
  resources :users
   post '/log_in' => 'users#log_in'
   get '/follow' => 'users#follow'
   get '/unfollow' => 'users#unfollow'
   get '/all_followers' => 'users#all_followers'
   get '/all_followees' => 'users#all_followees'
   get '/user/me' => 'users#show_user'

end
