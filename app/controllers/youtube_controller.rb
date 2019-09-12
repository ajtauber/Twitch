class YoutubeController < ApplicationController
  def info

  videos = Yt::Collections::Videos.new (
    videos.where(q: @video.name + ' Original Trailer', order: 'viewCount').first.id
  )
  end
end
