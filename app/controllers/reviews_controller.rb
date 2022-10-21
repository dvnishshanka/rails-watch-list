class ReviewsController < ApplicationController
  before_action :set_list, only: %i[create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.list_id = @list.id
    @review.save
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
