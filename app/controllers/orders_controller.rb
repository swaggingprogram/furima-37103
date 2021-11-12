class OrdersController < ApplicationController
  def index
    @record_order = RecordOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @record_order = RecordOrder.new(order_params)
    if @record_order.valid?
      @record_order.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private
  def order_params
    @item = Item.find(params[:item_id])
    params.require(:record_order).permit(:postal_code, :prefecture_id, :city, :port, :building, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end
end

