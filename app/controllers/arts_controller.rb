class ArtsController < ApplicationController
  def new
    @art = Art.new
  end

  def show
    @art = Art.find(params[:id])
  end

  def create
    @art = Art.new(art_params)
    if @art.save
      respond_to { |format| format.html { redirect_to @art } }
    else
      flash[:notice] = "You must fill out all of the required fields"
      render :new
    end
  end

  private

  def art_params
    params.require(:art).permit(
    :name, :location,
    :description,
    :category,
    :artist
    )
  end
end
