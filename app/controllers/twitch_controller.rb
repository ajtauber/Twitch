class TwitchController < ApplicationController

  def show

  end

  def info
    # Parsing
    @name = params[:name]

    # Get Request for names
    data = HTTParty.get "https://api.twitch.tv/helix/games?name=#{@name}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}

    @streams = HTTParty.get "https://api.twitch.tv/helix/streams?game_id=#{data['data'][0]['id']}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}
    @streams.body.force_encoding("UTF-8")
    # raise 'hell'

    # videos = Yt::Collections::Videos.new
    # @id = videos.where(q: @name + ' Original Trailer', order: 'viewCount').first.id
  end

  def form
  end

  def streamers
    @streamer = params[:streamer]
    @streamers = HTTParty.get "https://api.twitch.tv/helix/streams?user_login=#{@streamer}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}

  end

  def subscribers
    @broadcaster = params[:broadcaster]
    @subscribers = HTTParty.get "https://api.twitch.tv/helix/subscriptions/events?broadcaster_name=#{@broadcaster}", {:headers => {'Client-ID' => ENV['TWITCH_CLIENT_ID']}}
  end

end
