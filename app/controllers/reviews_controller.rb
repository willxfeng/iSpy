class ReviewsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def new
    @art = Art.find(params[:art_id])
    @review = Review.new
  end

  def create
    @art = Art.find(params[:art_id])
    @review = @art.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      ReviewMailer.new_review(@review).deliver_later
      redirect_to art_path(@art)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user == current_user
      raise_error
    end
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
      @art = Art.find(params[:art_id])
      Review.find(params[:id]).destroy

      redirect_to art_path(@art)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :art_id)
  end
end
