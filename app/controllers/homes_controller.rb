class HomesController < ApplicationController
  def top
    @spots = Spot.limit(5).order("created_at DESC")

  end

  def about
  end
end
