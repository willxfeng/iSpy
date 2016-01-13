class SearchController < ApplicationController
  def index
    if params[:query]
      @arts = Art.where("name ILIKE ?", "%#{params[:query]}%")
    end

    if @arts.empty? || params[:query].empty?
      flash[:notice] = "Sorry, no results."
    end
  end
end
