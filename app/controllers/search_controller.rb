class SearchController < ApplicationController
  def index
    if Art.where("name ILIKE ?", "%#{params[:query]}%")
      @arts = Art.search_by_name(params[:query])
      # binding.pry
    else
      flash[:notice] = "Sorry, no results."
      @arts = Art.all
    end
  end
end
