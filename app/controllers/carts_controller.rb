class CartsController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  authorize_resource
  def show
    @cart = set_cart
  end

  def reduce_quantity
    @cart = CartItem.find(params[:id])
    if @cart.quantity > 1
      @cart.quantity -= 1
    end
    @cart.save
    redirect_to cart_path
  end

  def create
    @cart = Cart.find_by(user_id: current_user.id)
    @product = Product.find(params[:product_id])
    @cart_item = @cart.add_product(@product)

    if @cart_item.save
      redirect_to cart_path(@cart_item)
    else
      render :new
    end
  end

  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
