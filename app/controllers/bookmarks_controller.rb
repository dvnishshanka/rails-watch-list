class BookmarksController < ApplicationController

  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    # redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
