class CartItemsController < ApplicationController
  before_action :authenticate_user!

  # def destroy
  #   @cart_item = CartItem.find(params[:id])
  #   @cart_item.destroy
  #   flash[:warning] = "删除#{@cart_item.product.title}成功"
  #
  #   redirect_to carts_path
  # end

  def destroy
    @cart = current_cart

    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "删除#{@product.title}成功"

    redirect_to carts_path
  end
end
