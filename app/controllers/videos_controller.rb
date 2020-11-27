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
    if @video.save
      flash[:success] = "Video enviado com sucesso!"
      redirect_to @video
    else
      render :new
    end
  end

  private

    def video_params
      params.require(:video).permit(:title, :description, :clip, :thumbnail)
    end

end