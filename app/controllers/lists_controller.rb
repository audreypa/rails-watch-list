class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update]

  def home; end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show; end

  def edit; end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'Your list was created ! 👏'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'Your list was updated ! 👏'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
