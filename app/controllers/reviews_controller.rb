class ReviewsController < ApplicationController
  def new
    @art = Art.find(params[:art_id])
    @review = Review.new
  end

  def create
    @art = Art.find(params[:art_id])
    @review = @art.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to art_path(@art)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @review.art = @art
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to art_path(@review.art)
    else
      flash[:notice] = "You must fill out all of the required fields"
      render :edit
    end
  end

  def destroy
    # if the user is allowed to do this
      @art = Art.find(params[:art_id])
      Review.find(params[:id]).destroy

      redirect_to art_path(@art)
    # else
    #   # flash that they're not allowed
    # end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :art_id)
  end
end
