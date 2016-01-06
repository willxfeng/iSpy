class ArtsController < ApplicationController
  def index
    @arts = Art.all.order("id ASC")
  end

  def new
    @art = Art.new
    @photo = Photo.new
  end

  def show
    @art = Art.find(params[:id])
  end

  def create
    @art = Art.new(art_params)
    if @art.save
      respond_to { |format| format.html { redirect_to art_path(@art) } }
    else
      flash[:error] = @art.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    if @art.update_attributes(art_params)
      redirect_to @art
    else
      flash[:notice] = "You must fill out all of the required fields"
      render :edit
    end
  end

  def destroy
    @arts = Art.all.order("id ASC")
    @art = Art.find(params[:id])
    @art.destroy

    redirect_to arts_path
  end

  private

  def art_params
    params.require(:art).permit(
      :name,
      :location,
      :description,
      :category,
      :artist
    )
  end
end
