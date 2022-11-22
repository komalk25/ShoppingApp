class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items 
  belongs_to :user

  def add_product(item)
    @order_item = order_items.create(product_id: item.product_id, quantity: item.quantity)
  end
end
