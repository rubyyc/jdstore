class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
        # flash[:notice] = "yyyy"
        # binding.pry
      end
      # flash[:notice] = "xxx"
      redirect_to order_path(@order.token)
    else
      false[:warning] ="Order Check Failed...Please try again."
      render 'carts/checkout'
    end
  end

  def show
    # @order = Order.find(params[:id])
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    # @order.pay!
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "使用支付宝付款成功"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    # @order.pay!
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "使用微信付款成功"
  end

  def apply_to_cancel
    @order = Order.find_by_token(params[:id])
    OrderMailer.apply_cancel(@order).deliver!
    flash[:notice] = "已提交申请"
    redirect_to :back
  end

  private



  def order_params
    params.require(:order).permit(:billing_address, :billing_name, :shipping_address, :shipping_name)
  end
end
