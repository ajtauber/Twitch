# == Route Map
#
#        Prefix Verb   URI Pattern               Controller#Action
#          root GET    /                         pages#home
#         users GET    /users(.:format)          users#index
#               POST   /users(.:format)          users#create
#      new_user GET    /users/new(.:format)      users#new
#     edit_user GET    /users/:id/edit(.:format) users#edit
#          user GET    /users/:id(.:format)      users#show
#               PATCH  /users/:id(.:format)      users#update
#               PUT    /users/:id(.:format)      users#update
#               DELETE /users/:id(.:format)      users#destroy
#   about_index GET    /about(.:format)          about#index
#               POST   /about(.:format)          about#create
#     new_about GET    /about/new(.:format)      about#new
#    edit_about GET    /about/:id/edit(.:format) about#edit
#         about GET    /about/:id(.:format)      about#show
#               PATCH  /about/:id(.:format)      about#update
#               PUT    /about/:id(.:format)      about#update
#               DELETE /about/:id(.:format)      about#destroy
#        twitch GET    /twitch(.:format)         twitch#info
# twitch_search GET    /twitch/search(.:format)  twitch#form
#               GET    /about(.:format)          about#index
#     streamers GET    /streamers(.:format)      twitch#streamers
#   twitch_team GET    /twitch/team(.:format)    twitch#team
#  twitch_teams GET    /twitch/teams(.:format)   twitch#teams
#     twitchapp GET    /twitchapp(.:format)      about#index
#  twitch_users GET    /twitch/users(.:format)   twitch#twitchusers
#          maps GET    /maps(.:format)           map#index
#       youtube GET    /youtube(.:format)        youtube#info
#         login GET    /login(.:format)          session#new
#               POST   /login(.:format)          session#create
#               DELETE /login(.:format)          session#destroy

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
