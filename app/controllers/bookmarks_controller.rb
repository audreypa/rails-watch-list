class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new show edit update]
  before_action :set_bookmark, only: %i[show edit update]
  before_action :movies, only: %i[new create]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit; end

  def show; end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
    if @bookmark.save!
      redirect_to list_path(@list), notice: 'Your bookmark was created ! 👏'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bookmark.update!(bookmark_params)
      redirect_to list_path(@list), notice: 'Your bookmark was updated ! 👏'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def movies
    @movie = Movie.all
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
