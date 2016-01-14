class HomeController < ApplicationController
  def show
    @arts = Art.first(6)
  end
end
