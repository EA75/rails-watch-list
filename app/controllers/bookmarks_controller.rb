class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit destroy ]

  def index
    @bookmarks = Bookmark.all
  end

  def show() end

  def new
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
      render "lists/show", status: :unprocessable_entity
    end
  end

  def edit() end

  def destroy
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
