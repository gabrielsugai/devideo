class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new]
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
    @video = current_user.videos.new(video_params)
    if @video.save
      flash[:success] = "Video enviado com sucesso!"
      redirect_to @video
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to @video
    else
      render :edit
    end
  end

  private

    def video_params
      params.require(:video).permit(:title, :description, :clip, :thumbnail, :user_id)
    end

end