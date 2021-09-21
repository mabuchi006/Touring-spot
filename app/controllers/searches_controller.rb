class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "spot"
      @records = Spot.search_for(@content, @method)
    elsif @model == "genre"
      @records = Genre.search_for(@content, @method)
      @records_genre = Spot.where(genre_id: @records.ids)
    else
      @records = User.search_for(@content, @method)
    end
  end
end
