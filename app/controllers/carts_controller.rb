class CartsController < ApplicationController

  def index
  end

  def clean
    current_cart.clean!
    flash[:warning] = '购物车已清空'
    redirect_to carts_path
  end
end
