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

  private

  def review_params
    params.require(:review).permit(:body, :rating, :art_id)
  end
end
