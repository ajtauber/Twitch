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
# Twitch Section
  get '/twitch' => 'twitch#info'

  get '/twitch/search' => 'twitch#form'

  get '/about' => 'about#index'
  get '/streamers' => 'twitch#streamers' # Displays all top streamers
  get '/twitch/team' => 'twitch#team' # Search for a specific team
  get '/twitch/teams' => 'twitch#teams' # All Featured Teams Displayed
  get '/twitchapp' => 'about#index' # For Auth Gem
  get '/twitch/users' => 'twitch#twitchusers'

  # Displaying the map API
  get '/maps' => 'map#index'
  get '/youtube' => 'youtube#info'
  # Gets Logins
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
