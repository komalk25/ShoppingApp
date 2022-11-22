module CurrentOrder
  private

  def set_order
    @user = current_user
    @order = @user.order.create
    @order.save
  end
end
