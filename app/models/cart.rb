class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders
  belongs_to :user
  def add_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    if current_item
      current_item.increment(:quantity)
      current_item.save
    else
      current_item = cart_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    cart_items.to_a.sum{|item| item.total_price}
  end
end
