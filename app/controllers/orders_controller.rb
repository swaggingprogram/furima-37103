class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :after_purchase, only: [:index]
  before_action :purchase_guard, only: [:index]

  def index
    @record_order = RecordOrder.new
    instance
  end

  def create
    @record_order = RecordOrder.new(order_params)
    instance
    if @record_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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
    instance
    params.require(:record_order).permit(:postal_code, :prefecture_id, :city, :port, :building, :tel).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def after_purchase
    instance
    redirect_to root_path if @item.record.present?
  end

  def purchase_guard
    instance
    redirect_to root_path if @item.user.id == current_user.id
  end

  def instance
    @item = Item.find(params[:item_id])
  end
end
