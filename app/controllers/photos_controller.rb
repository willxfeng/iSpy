class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @photo.art_id = params[:art_id]
    if @photo.save
      flash[:notice] = "Photo successfully added!"
    else
      flash[:error] = @photo.errors.full_messages.join('. ')
    end
    redirect_to art_path(params[:art_id])
  end

  private

  def photo_params
    params.require(:photo).permit(
      :art_photo,
      :caption
    )
  end
end
