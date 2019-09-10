class TwitchController < ApplicationController

  def show

  end

  def info
    @name = params[:name]
    data = HTTParty.get "https://api.twitch.tv/helix/games?name=#{@name}", {:headers => {'Client-ID' => 'c9jwzn89djnpijcis4zudsdowyhk0s'}}

    streams = HTTParty.get "https://api.twitch.tv/helix/streams?game_id=#{data['data'][0]['id']}"
    # raise 'hell'
  end

  def form

  end


end
