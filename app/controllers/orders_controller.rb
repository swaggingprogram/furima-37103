class OrdersController < ApplicationController
  def index
    @record_order = RecordOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @record_order = RecordOrder.new(order_params)
    @item = Item.find(params[:item_id])
    binding.pry
    if @record_order.valid?
      Payjp.api_key = "sk_test_845dc5947b7c07ab2329b71c"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @record_order.save
      redirect_to root_path
    else 
      render :index
    end
  end  

  private
  def order_params
    @item = Item.find(params[:item_id])
    params.require(:record_order).permit(:postal_code, :prefecture_id, :city, :port, :building, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end
