class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy, :complete]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: "新增記事成功！"
    else
      render :new
    end
  end

  def show
    @items = @list.items
  end

  def edit
    @items = @list.items
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, alert: "記事已刪除！"
  end

  def complete
    @list.update_attribute(:done, true)

    redirect_to lists_path
  end
  private

  def list_params
    params.require(:list).permit(:title, :content, items_attributes: [:id, :content, :done, :_destroy])
  end

  def find_list
    @list = List.find(params[:id])
  end
end
