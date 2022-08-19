class BookmarksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @movies = Movie.all
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create

    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
    redirect_to list_path(@list)
    else
      render "new"
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
