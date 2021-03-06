class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit, :destroy ]

  def index
    @pictures = Picture.all.order(created_at: :desc)
  end
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end
  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "投稿完了！"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    @picture.user_id = current_user.id
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集完了！"
    else
      render :edit
    end
  end
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"削除完了！"
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
  def login_check
    unless logged_in?
      redirect_to sessions_path
    end
  end
 
end
