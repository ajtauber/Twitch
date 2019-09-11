class TwitchController < ApplicationController

  def show

  end

  def info
    # Parsing
    @name = params[:name]

    # Get Request for names
    data = HTTParty.get "https://api.twitch.tv/helix/games?name=#{@name}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}


    @streams = HTTParty.get "https://api.twitch.tv/helix/streams?game_id=#{data['data'][0]['id']}&after=#{params[:cursor]}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}
    @streams.body.force_encoding("UTF-8")

    @cursor = @streams['pagination']['cursor'] if @streams['pagination']

    # videos = Yt::Collections::Videos.new
    # @id = videos.where(q: @name + ' Original Trailer', order: 'viewCount').first.id
  end

  def form
  end

  def streamers
    @streamer = params[:streamer]
    # @streamers = HTTParty.get "https://api.twitch.tv/helix/streams?user_name=#{@streamer}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}
    # GET https://api.twitch.tv/helix/users?login=<username>
    @streamers = HTTParty.get "https://api.twitch.tv/helix/users?login=#{@streamer}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}

  end

  def subscribers
    @broadcaster = params[:broadcaster]
    @subscribers = HTTParty.get "https://api.twitch.tv/helix/subscriptions/events?broadcaster_name=#{@broadcaster}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}
  end

  def teams
    @team = params[:team]
    @teams = HTTParty.get "https://api.twitch.tv/kraken/teams/#{@team}",  {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}

    # Getting a Specific team

  end

  def create

  end

  def video
    @video = HTTParty.get "https://api.twitch.tv/kraken/videos/#{@video}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}

  end
end
