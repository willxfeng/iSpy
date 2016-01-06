class PhotosController < ApplicationController
  def create
    @art = Art.find(params[:art_id])
    @photo = Photo.new(photo_params)
    @photo.art = @art

    unless @photo.save
      flash[:error] = @photo.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(
      :url,
      :caption,
      :art_id
    )
  end
end
