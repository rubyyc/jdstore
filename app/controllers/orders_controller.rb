class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    if @order.save
      redirect_to order_path(@order)
    else
      false[:warning] ="Order Check Failed...Please try again."
      render 'carts/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:billing_address, :billing_name, :shipping_address, :shipping_name)
  end
end
