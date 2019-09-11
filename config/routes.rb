# == Route Map
#
#     Prefix Verb URI Pattern           Controller#Action
# user_index GET  /user/index(.:format) user#index
#   user_new GET  /user/new(.:format)   user#new
#  user_edit GET  /user/edit(.:format)  user#edit
#  user_show GET  /user/show(.:format)  user#show

Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users
  resources :about

  get '/twitch' => 'twitch#info'

  get '/twitch/search' => 'twitch#form'

  get '/about' => 'about#index'
  get '/streamers' => 'twitch#streamers'
  get '/twitch/team' => 'twitch#team'
  get '/twitch/teams' => 'twitch#teams'
  get '/twitchapp' => 'about#index'
  get '/featured' => 'featured#streamers'
  get '/twitch/users' => 'twitch#twitchusers'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
