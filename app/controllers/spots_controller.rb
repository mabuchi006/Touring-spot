class SpotsController < ApplicationController
  before_action :authenticate_customer!,except:[:index, :show]

  def top
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def about
  end

  def index
    @spots = Spot.all
    @spots = Spot.page(params[:page]).reverse_order
  end

end