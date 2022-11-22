class CartItemsController < ApplicationController
  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id)
  end
end
