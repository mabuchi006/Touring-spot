class SpotCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@spot = Spot.find(params[:spot_id])
		@spot_comment = SpotComment.new(spot_comment_params)
		@spot_comment.spot_id = @spot.id
		@spot_comment.user_id = current_user.id
		if @spot_comment.save
  		redirect_to spot_path(@spot.id)
		else
		  render 'spots/show'
		end
	end

	def destroy
		@spot = Spot.find(params[:spot_id])
  	spot_comment = @spot.spot_comments.find(params[:id])
		spot_comment.destroy
		redirect_to request.referer
	end

	private
	def spot_comment_params
		params.require(:spot_comment).permit(:comment)
	end
end