class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_guard, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :status_id, :fee_id, :place_id, :arrive_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def item_guard
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end
end
