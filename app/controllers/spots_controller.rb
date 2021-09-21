class SpotsController < ApplicationController
  before_action :authenticate_customer!,except:[:index, :show]

  def top
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @spot_comment = SpotComment.new
  end

  def about
  end

  def index
    @spots = Spot.all

  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    if @spot.save
      redirect_to spot_path(@spot), notice: "You have created spot successfully."
    else
      @spots = Spot.all
      render 'show'
    end
  end
end