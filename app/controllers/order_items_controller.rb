class OrderItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @quantity = form_params[:quantity]
    @size = form_params[:size]
    @current_cart.order_items.create(product: @product, quantity: @quantity, size: @size)
    flash[:success] = "Thanks for adding to your cart"
    redirect_to shop_path
  end

  def update
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.update(form_params)
    flash[:success] = "Thanks for updating your cart"
    redirect_to cart_path
  end

  def destroy
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.delete
    flash[:success] = "Product removed from cart"
    redirect_to cart_path
  end


  def form_params
    params.require(:order_item).permit(:quantity, :size)
  end

end
