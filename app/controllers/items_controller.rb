class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @item = @list.items.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      redirect_to list_path(@list), notice: "新增記事項目成功！"
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

    if @item.update(item_params)
      redirect_to list_path(@list), notice: "更新記事項目成功！"
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.destroy
    redirect_to list_path(@list), alert: "記事項目已刪除！"
  end

  def complete
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.update_attribute(:done, true)

    redirect_to list_path(@list)
  end

  private
  def item_params
    params.require(:item).permit(:content)
  end
end
