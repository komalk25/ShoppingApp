module CurrentCart
  private

  def set_cart
    @user = current_user
    @set_cart = @user.cart || @user.create_cart
    @set_cart.save
    @set_cart
  end
end
