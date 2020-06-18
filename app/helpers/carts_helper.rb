module CartsHelper
  def render_cart_total_price(cart)
    # sum = 0
    #
    # cart.cart_items.each do |item|
    #   if item.product.price.present?
    #     sum += item.product.price * item.quantity
    #   end
    # end
    # sum
    cart.total_price
  end

end
