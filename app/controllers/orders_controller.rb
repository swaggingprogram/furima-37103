class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :after_purchase, only: [:index]
  before_action :purchase_guard, only: [:index]

  def index
    @record_order = RecordOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @record_order = RecordOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @record_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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

  def after_purchase
    @item = Item.find(params[:item_id])
    if @item.record.present?
      redirect_to root_path
    end
  end

  def purchase_guard
    @item = Item.find(params[:item_id])
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end
end
