class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, only: [:index]
  before_action :item_find_params, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find_params
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :phone).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = 'sk_test_6f512f2e0e0de6031b70bae0'
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    if Buy.where(item_id: params[:item_id]).present? && current_user.id != Item.find(params[:item_id]).user_id
      redirect_to root_path
    elsif current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end
end
