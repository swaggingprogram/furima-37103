class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :instance, only: [:show, :edit, :update, :item_guard, :after_purchase]
  before_action :item_guard, only: [:edit]
  before_action :after_purchase, only: [:edit]

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
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if item.user.id == current_user.id
      item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :status_id, :fee_id, :place_id, :arrive_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def item_guard
    redirect_to action: :index unless @item.user.id == current_user.id || @item.record.blank?
  end

  def after_purchase
    redirect_to root_path if @item.record.present?
  end

  def instance
    @item = Item.find(params[:id])
  end
end
