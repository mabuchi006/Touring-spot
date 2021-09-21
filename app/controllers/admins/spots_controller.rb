class Admins::SpotsController < ApplicationController
  before_action :authenticate_admin!

  def top
  end

  def index
    @spots = Spot.all
    @spots = Spot.page(params[:page]).reverse_order
  end

  def new
    @spot = Spot.new
    @genres = Genre.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
    @genres = Genre.all
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to admins_spots_path
    else
      redirect_to new_admins_spot_path
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to admins_spot_path(@spot)
    else
      render :edit
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:image, :name, :introduction, :is_active, :genre_id)
  end
end
