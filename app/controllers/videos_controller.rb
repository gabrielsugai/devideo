class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @views = VideoView.where(video_id: @video)
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
    if current_user.id != @video.user_id
      flash[:errors] = "Acesso Negado!"
      redirect_to root_path
    end
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
      params.require(:video).permit(:title, :description, :clip, :thumbnail, :url, :user_id)
    end

end