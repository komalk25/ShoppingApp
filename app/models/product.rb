class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_cart_item
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  has_many :orders
  belongs_to :seller
  has_many :cart_items

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, numericality: {greater_than_or_equal_to: 0}
 
  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base,'cart items present')
      throw :abort
    end
  end
end
