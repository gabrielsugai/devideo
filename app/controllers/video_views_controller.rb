class VideoViewsController < ApplicationController
  def create
    puts('====================')
    puts(params)
    @view = VideoView.new(views_params)
    @view.save
  end

  private
    def views_params
      params.require(:video_view).permit(:video_id)
    end
end