class Photo < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo successfully added!"
    else
      flash[:error] = @art.errors.full_messages.join('. ')
    end
    render :new
  end

  private
  def photo_params
    params.require(:photo).permit(
      :art_photo,
      :caption
    )
  end
end
