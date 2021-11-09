class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :status_id, :fee_id, :place_id, :arrive_id, :price, :image).merge(user_id: current_user.id)
  end
end
