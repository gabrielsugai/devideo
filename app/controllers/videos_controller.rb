class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    flash[:success] = "Video enviado com sucesso!"
    if @video.save
      redirect_to @video
    else
      redirect_to root_path
    end
  end

  private

    def video_params
      params.require(:video).permit(:title, :description, :clip, :thumbnail)
    end

end