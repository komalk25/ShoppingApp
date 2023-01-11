class CartsController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  authorize_resource
  def show
    @carts = set_cart
  end

  def reduce_quantity
    @cart = Cart.find_by(user_id: current_user.id)
    @cart_quantity = CartItem.find(params[:id])
    if @cart_quantity.quantity > 1
      @cart_quantity.quantity -= 1
    end
    respond_to do |format|
      if @cart_quantity.save
        format.turbo_stream{
          render turbo_stream:[
            turbo_stream.update("cartshow", partial: "carts/cart", locals:{cart: @cart})
          ]
        }
       format.html{ redirect_to cart_path(@cart)} 
      end  
    end  
  end
  def create
    @cart = Cart.find_by(user_id: current_user.id)
    @product = Product.find(params[:product_id])
    @cart_item = @cart.add_product(@product)
    respond_to do |format|
      if @cart_item.save
        format.turbo_stream
        # format.turbo_stream do
        #   render turbo_stream:[
        #     turbo_stream.update('cartshow', partial: "carts/cart", locals: {cart: @cart}),
        #     ]   
        # end  
        #format.html { redirect_to cart_path}
      else
        render :new
      end
    end  
  end
  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    @cart_item_destroy = @cart.cart_items.find(params[:id])
    @cart_item_destroy.destroy
    respond_to do |format|
      format.turbo_stream{
        render turbo_stream:[
          turbo_stream.remove("cart_it_#{@cart_item_destroy.id}"),
          turbo_stream.update('cartshow', partial: "carts/cart", locals: {cart: @cart} )
        ]
      }
      format.html
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
