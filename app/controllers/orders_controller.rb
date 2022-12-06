class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @user = current_user
    @cart = @user.cart
    if @cart.cart_items.blank?
    else
      @order = @user.order.create(date: Time.now)
      if @order.save
        OrderMailer.order_confirm(@user).deliver_now
      end    
    end

    @cart.cart_items.each do |item|
      @order_item = @order.add_product(item)
      if @order_item
        @cart_item = CartItem.find_by(params[:cart_id])
        @cart_item.destroy
      end
    end

    redirect_to order_path(@order) if @order
  end
end
