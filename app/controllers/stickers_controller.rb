class StickersController < ApplicationController

  def index
    @stickers = Sticker.all
  end

  def new
    @sticker = Sticker.new
  end

  def create
    @sticker = Sticker.new(sticker_params)
    if @sticker.save
      redirect_to stickers_path
    else
      render "edit"
    end
  end

  def edit
    @sticker = Sticker.find(params[:id])
  end

  def update
    @sticker = Sticker.find(params[:id])
    authorize @sticker
    if @sticker.update_attributes(sticker_params)
      redirect_to sticker_path(@sticker)
    else
      flash[:error] = @sticker.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def show
    @sticker = Sticker.find(params[:id])
  end

  private

  def sticker_params
    params.require(:sticker).permit(:id, :color, :text)
  end


end
