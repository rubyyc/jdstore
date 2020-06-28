class ProductsController < ApplicationController
  impressionist :actions=>[:show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if @product.quantity == 0
      flash[:warning] = "库存不足"
      # redirect_to :back
    else
      if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
      else
        @cart_item = current_cart.cart_items.find_by(product_id: @product.id)
        @cart_item.quantity += 1
        @cart_item.save
      end

      @product.quantity -= 1
      @product.save

      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    end
    redirect_to :back
  end
end
